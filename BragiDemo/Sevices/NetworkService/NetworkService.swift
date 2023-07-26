//
//  NetworkService.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import RxSwift
import Alamofire

final class NetworkService: NetworkServiceProtocol {
    private let sessionManager: Session
    private let responseSerializer = BaseDataResponseSerializer()
    private let reachabilityManager = NetworkReachabilityManager()

    private let queue: DispatchQueue = .init(
        label: String(describing: NetworkService.self),
        qos: .background
    )

    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }

    // MARK: - Instance Methods

    private func createUrlRequest<T: NetworkingRequest>(_ request: T) throws -> URLRequest {
        let requestDescriptor = request.getRequestDescriptor()
        let url = requestDescriptor.baseUrl
            .appendingPathComponent(requestDescriptor.prefix)
            .appendingPathComponent(requestDescriptor.path)
        var urlRequest = try URLRequest(url: url, method: requestDescriptor.method)
        urlRequest = applyAdapter(urlRequest, requestDescriptor: requestDescriptor)
        urlRequest = try requestDescriptor.encoding.encode(urlRequest, with: requestDescriptor.params)
        return urlRequest
    }

    private func applyAdapter(
        _ urlRequest: URLRequest,
        requestDescriptor: RequestDescriptor
    ) -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.allHTTPHeaderFields = requestDescriptor.headers
        return urlRequest
    }

    private var isConnected: Bool {
        return reachabilityManager?.isReachable ?? false
    }

    private var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension NetworkService {
    func data<T: NetworkingRequest>(_ request: T) -> Observable<Result<Data, NetworkError>> {
        return Observable<Result<Data, NetworkError>>.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            guard self.isConnected else {
                observer.onNext(.failure(.noConnection))
                observer.onCompleted()
                return Disposables.create()
            }

            guard let request = try? self.createUrlRequest(request) else {
                observer.onNext(.failure(.badRequest))
                observer.onCompleted()
                return Disposables.create()
            }

            let dataRequest = self.sessionManager.request(request)
                .responseData(queue: self.queue) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(.success(data))
                        observer.onCompleted()
                    case .failure(let error):
                        let networkError = NetworkError.alamofireError(error: error)
                        observer.onNext(.failure(networkError))
                        observer.onCompleted()
                    }
                }

            return Disposables.create {
                dataRequest.cancel()
            }
        }
    }

    func json<T: NetworkingRequest>(_ request: T) -> Observable<Result<T.ResponseType, NetworkError>> {
        return data(request)
            .map { [weak self] dataResult in
                guard let self = self else { return .failure(.invalidError) }
                switch dataResult {
                case let .success(data):
                    do {
                        let response = try self.jsonDecoder.decode(T.ResponseType.self, from: data)
                        return .success(response)
                    } catch {
                        return .failure(.custom(error))
                    }
                case let .failure(networkError):
                    return .failure(networkError)
                }
            }
    }
}
