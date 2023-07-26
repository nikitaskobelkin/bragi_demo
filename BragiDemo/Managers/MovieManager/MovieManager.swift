//
//  MovieManager.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

final class MovieManager: MovieManagerProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getGenres(for contentType: ContentType) async -> Result<GenresResponse, NetworkError> {
        let request = GenresRequest(contentType: contentType)
        return await doRequest(request)
    }

    func getMovies(page: Int, genre: String) async -> Result<MoviesResponse, NetworkError> {
        let request = MoviesRequest(page: page, genre: genre)
        return await doRequest(request)
    }

    private func doRequest<T: NetworkingRequest>(_ request: T) async -> Result<T.ResponseType, NetworkError> {
        guard let value = try? await networkService.json(request).asSingle().value else { return .failure(.unprocessableEntity) }
        return value
    }
}
