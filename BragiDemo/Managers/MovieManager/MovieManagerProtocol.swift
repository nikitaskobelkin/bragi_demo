//
//  MovieManagerProtocol.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

protocol MovieManagerProtocol {
    func getGenres(for contentType: ContentType) async -> Result<GenresResponse, NetworkError>
    func getMovies(page: Int, genre: Int, contentType: ContentType) async -> Result<LibraryResponse, NetworkError>
    func getMoviesDetails(id: Int) async -> MoviesDetailsResponse?
    func getMoviesPreview(previewPath: String) async -> Data?
    func getTVShowsDetails(id: Int) async -> TVShowsDetailsResponse?
}
