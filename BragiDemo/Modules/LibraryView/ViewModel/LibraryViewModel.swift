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
    @Published private(set) var items: [MovieItem] = []
    @Published private(set) var filters: [FilterItem] = []
    @Published var selectedFilter: FilterItem?
    private var pagination: Int = 1
    let contentType: ContentType
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
                guard selectedFilter == nil else { break }
                selectedFilter = filters.first
            case .failure:
                break
            }
            isLoading = false
        }
    }

    func fetchMovies(refresh: Bool) {
        guard let genre = selectedFilter?.id else { return }
        isLazyLoading = true
        if refresh {
            items = []
            pagination = 1
        }
        Task { @MainActor in
            let response = await movieManager.getMovies(page: pagination, genre: genre, contentType: contentType)
            switch response {
            case .success(let success):
                let newMovies: [MovieItem] = success.results
                    .filter({ movie in
                        guard let id = movie.id else { return false }
                        return !items.contains(where: { $0.id == id })
                    })
                    .compactMap {
                        guard let id = $0.id else { return nil }
                        guard let title = contentType == .movies ? $0.title : $0.name else { return nil }
                        // MARK: For image we must use Caching mechanism, now i just don't have time for it :(
                        return MovieItem(
                            id: id,
                            imagePath: $0.posterPath,
                            title: title,
                            rating: $0.voteAverage
                        )
                    }
                items.append(contentsOf: newMovies)
                pagination += 1
            case let .failure(error):
                print(error)
            }
            isLazyLoading = false
        }
    }
}
