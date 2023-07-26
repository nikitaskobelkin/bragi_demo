//
//  MoviesRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire
import Foundation

struct MoviesRequest: NetworkingRequest {
    typealias ResponseType = LibraryResponse

    private let page: Int
    private let genre: String
    private let type: ContentType

    init(page: Int, genre: Int, type: ContentType) {
        self.page = page
        self.genre = "\(genre)"
        self.type = type
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

    var path: String {
        switch type {
        case .movies: return NetworkConstants.Paths.movies.rawValue
        case .tv: return NetworkConstants.Paths.tvs.rawValue
        }
    }
}
