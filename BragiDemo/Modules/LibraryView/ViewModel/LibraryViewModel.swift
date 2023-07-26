//
//  LibraryViewModel.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

class LibraryViewModel: ObservableObject {
    @Published private(set) var filters: [FilterItem] = []
    @Published var selected: FilterItem?
    private let contentType: ContentType
    private let movieManager: MovieManagerProtocol

    init(contentType: ContentType, movieManager: MovieManagerProtocol) {
        self.contentType = contentType
        self.movieManager = movieManager
    }

    func fetch() {
        Task { @MainActor in
            let response = await movieManager.getGenres(for: contentType)
            switch response {
            case .success(let success):
                filters = success.genres.compactMap {
                    guard let id = $0.id, let title = $0.name else { return nil }
                    return FilterItem(id: id, title: title)
                }
                guard selected == nil else { return }
                selected = filters.first
            case .failure:
                return
            }
        }
    }
}
