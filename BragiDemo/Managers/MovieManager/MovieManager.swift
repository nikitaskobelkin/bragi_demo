//
//  MovieManager.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import Combine

final class MovieManager: MovieManagerProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getGenres(for contentType: ContentType) async -> Result<GenresResponse, NetworkError> {
        let request = GenresRequest(contentType: contentType)
        return await networkService.json(request).async()
    }
}
