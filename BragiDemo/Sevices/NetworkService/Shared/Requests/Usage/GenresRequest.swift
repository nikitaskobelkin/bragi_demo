//
//  GenresRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire
import Foundation

struct GenresRequest: NetworkingRequest {
    typealias ResponseType = GenresResponse

    private let contentType: ContentType

    init(contentType: ContentType) {
        self.contentType = contentType
    }

    func getRequestDescriptor() -> RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.baseURL,
            path: path,
            method: .get,
            headers: [
                RequestHeaderKey.authorization.rawValue: RequestAccessContent.bearer(
                    apiKey: NetworkConstants.apiKey
                ).rawValue
            ],
            encoding: URLEncoding.default
        )
    }
}

// MARK: - Paths

private extension GenresRequest {
    var path: String {
        switch contentType {
        case .movies: return NetworkConstants.Paths.genresMovies.rawValue
        case .tv: return NetworkConstants.Paths.genresTV.rawValue
        }
    }
}
