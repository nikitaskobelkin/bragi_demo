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

    func getMovies(
        page: Int,
        genre: Int,
        contentType: ContentType
    ) async -> Result<LibraryResponse, NetworkError> {
        let request = MoviesRequest(page: page, genre: genre, type: contentType)
        return await doRequest(request)
    }

    func getMoviesDetails(id: Int) async -> MoviesDetailsResponse? {
        let request = MoviesDetailsRequest(id: id)
        return await doRequest(request).successValue
    }

    func getMoviesPreview(previewPath: String) async -> Data? {
        let request = MoviesPreviewRequest(previewPath: previewPath)
        guard let value = try? await networkService.data(request).asSingle().value else { return nil }
        return value.successValue
    }

    func getTVShowsDetails(id: Int) async -> TVShowsDetailsResponse? {
        let request = TvShowsDetailsRequest(id: id)
        return await doRequest(request).successValue
    }

    private func doRequest<T: NetworkingRequest>(_ request: T) async -> Result<T.ResponseType, NetworkError> {
        guard let value = try? await networkService.json(request).asSingle().value else { return .failure(.unprocessableEntity) }

        return value
    }
}
