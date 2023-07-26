//
//  NetworkConstants.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

struct NetworkConstants {
    static let baseURL: URL = URL(string: "https://api.themoviedb.org/3/")!
    static let apiKey: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YmViNTUxNTFmZDJkOTM4YjYyOTQ2ZDE0NDYwYWM0YyIsInN1YiI6IjY0YmYwMWJjNmQ0Yzk3MDExY2I5YTgyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VqtC412NDWvMjUkrztI6FM_sFB0FLX6zBTTcLdPDKsc"

    enum Paths: String {
        case genresMovies = "genre/movie/list"
        case genresTV = "genre/tv/list"
        case movies = "discover/movie"
    }
}
