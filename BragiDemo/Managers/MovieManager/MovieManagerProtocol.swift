//
//  MovieManagerProtocol.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

protocol MovieManagerProtocol {
    func getGenres(for contentType: ContentType) async -> Result<GenresResponse, NetworkError>
    func getMovies(page: Int, genre: String) async -> Result<MoviesResponse, NetworkError>
//    func getTVShows(for contentType: ContentType) async -> Result<GenresResponse, NetworkError>
}
