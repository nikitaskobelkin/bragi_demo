//
//  MoviesDetailsRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire
import Foundation

struct MoviesDetailsRequest: NetworkingRequest {
    typealias ResponseType = MoviesDetailsResponse

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func getRequestDescriptor() -> RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.baseURL,
            path: NetworkConstants.Paths.movie.rawValue + "/" + "\(id)",
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
