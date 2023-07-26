//
//  MoviesRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire
import Foundation

struct MoviesRequest: NetworkingRequest {
    typealias ResponseType = MoviesResponse

    private let page: Int
    private let genre: String

    init(page: Int, genre: String) {
        self.page = page
        self.genre = genre
    }

    func getRequestDescriptor() -> RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.baseURL,
            path: NetworkConstants.Paths.movies.rawValue,
            method: .get,
            headers: [
                RequestHeaderKey.authorization.rawValue: RequestAccessContent.bearer(
                    apiKey: NetworkConstants.apiKey
                ).rawValue
            ],
            params: [
                ParamKey.page.rawValue: page,
                ParamKey.withGenres.rawValue: genre
            ],
            encoding: URLEncoding.default
        )
    }
}

private extension MoviesRequest {
    enum ParamKey: String {
        case page
        case withGenres = "with_genres"
    }
}
