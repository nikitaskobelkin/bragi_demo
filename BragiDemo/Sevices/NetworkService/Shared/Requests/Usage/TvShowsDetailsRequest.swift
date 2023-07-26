//
//  TvShowsDetailsRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import Alamofire
import Foundation

struct TvShowsDetailsRequest: NetworkingRequest {
    typealias ResponseType = TVShowsDetailsResponse

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func getRequestDescriptor() -> RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.baseURL,
            path: NetworkConstants.Paths.tv.rawValue + "/" + "\(id)",
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
