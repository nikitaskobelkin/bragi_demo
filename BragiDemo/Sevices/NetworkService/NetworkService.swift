//
//  NetworkService.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import Combine
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
    func data<T: NetworkingRequest>(_ request: T) -> AnyPublisher<Data, NetworkError> {
        guard isConnected else { return Fail(error: NetworkError.noConnection).eraseToAnyPublisher() }
        guard let request = try? createUrlRequest(request) else {
            return Fail(error: NetworkError.badRequest).eraseToAnyPublisher()
        }
        return sessionManager.request(request)
            .publishResponse(using: responseSerializer, on: queue)
            .value()
            .mapError { NetworkError.alamofireError(error: $0) }
            .eraseToAnyPublisher()
    }

    func json<T: NetworkingRequest>(_ request: T) -> AnyPublisher<T.ResponseType, NetworkError> {
        return data(request)
            .compactMap { [weak self] in
                guard let self = self else { return nil }
                return try? self.jsonDecoder.decode(T.ResponseType.self, from: $0)
            }
            .mapError { NetworkError.custom($0) }
            .eraseToAnyPublisher()
    }
}
