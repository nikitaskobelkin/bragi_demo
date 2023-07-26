//
//  MoviesPreviewRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire
import Foundation

struct MoviesPreviewRequest: NetworkingRequest {
    typealias ResponseType = Data

    private let previewPath: String
    private let size: ImageSize

    init(previewPath: String, size: ImageSize = .w500) {
        self.previewPath = previewPath
        self.size = size
    }

    func getRequestDescriptor() -> RequestDescriptor {
        RequestDescriptor(
            baseUrl: NetworkConstants.imageBaseURL,
            path: size.path + previewPath,
            method: .get,
            encoding: URLEncoding.default
        )
    }
}
