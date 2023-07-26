//
//  LibraryViewModel.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

class LibraryViewModel: ObservableObject {
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isLazyLoading: Bool = false
    @Published private(set) var movies: [MovieItem] = []
    @Published private(set) var filters: [FilterItem] = []
    @Published var selectedFilter: FilterItem?
    private var pagination: Int = 1
    private let contentType: ContentType
    private let movieManager: MovieManagerProtocol

    init(contentType: ContentType, movieManager: MovieManagerProtocol) {
        self.contentType = contentType
        self.movieManager = movieManager
    }

    func fetchGenres() {
        isLoading = true
        Task { @MainActor in
            let response = await movieManager.getGenres(for: contentType)
            switch response {
            case .success(let success):
                filters = success.genres.compactMap {
                    guard let id = $0.id, let title = $0.name else { return nil }
                    return FilterItem(id: id, title: title)
                }
                guard selectedFilter == nil else { return }
                selectedFilter = filters.first
            case .failure:
                return
            }
            isLoading = false
        }
    }

    func fetchMovies(genre: String, refresh: Bool) {
        isLazyLoading = true
        if refresh {
            movies = []
        }
        Task { @MainActor in
            let response = await movieManager.getMovies(page: pagination, genre: genre)
            switch response {
            case .success(let success):
                let newMovies: [MovieItem] = success.results
                    .filter({ movie in
                        guard let id = movie.id else { return false }
                        return !movies.contains(where: { $0.id == id })
                    })
                    .compactMap {
                        guard let id = $0.id, let originalTitle = $0.title else { return nil }
                        return MovieItem(
                            id: id,
                            image: nil,
                            title: $0.title ?? originalTitle
                        )
                    }
                movies.append(contentsOf: newMovies)
                pagination += 1
            case let .failure(error):
                print(error)
            }
            isLazyLoading = false
        }
    }

    func fetchMoviesDetails() {
        
    }
}
