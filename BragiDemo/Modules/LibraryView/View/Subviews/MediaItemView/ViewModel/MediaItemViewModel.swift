//
//  TVShowItemViewModel.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

protocol MediaItemViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var image: Image? { get }
    var details: [DetailModel] { get }
    var item: MovieItem { get }
    func fetchData()
}

final class MediaItemViewModel: MediaItemViewModelProtocol {
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var image: Image?
    @Published private(set) var details: [DetailModel] = []
    let item: MovieItem
    private let contentType: ContentType
    private let movieManager: MovieManagerProtocol
    private let imageCacheService: ImageCacheServiceProtocol

    init(
        item: MovieItem,
        contentType: ContentType,
        movieManager: MovieManagerProtocol,
        imageCacheService: ImageCacheServiceProtocol
    ) {
        self.item = item
        self.contentType = contentType
        self.movieManager = movieManager
        self.imageCacheService = imageCacheService
    }

    func fetchData() {
        guard let path = item.imagePath else { return }
        isLoading = true
        Task { @MainActor in
            if let imageFromCache = imageCacheService.image(for: path) {
                image = Image(uiImage: imageFromCache)
            } else if let response = await movieManager.getMoviesPreview(previewPath: path),
                let uiImage = UIImage(data: response)
            {
                image = Image(uiImage: uiImage)
                imageCacheService.insertImage(uiImage, for: path)
            }
            switch contentType {
            case .movies:
                details = await fetchMovieDetails()
            case .tv:
                details = await fetchTVShowDetails()
            }
            isLoading = false
        }
    }

    private func fetchMovieDetails() async -> [DetailModel] {
        guard let data = await movieManager.getMoviesDetails(id: item.id) else { return [] }
        var fetchResult: [DetailModel] = []
        if let budget = data.budget, budget > 0 {
            fetchResult.append(DetailModel(title: .budget, value: budget.short))
        }
        if let revenue = data.revenue, revenue > 0 {
            fetchResult.append(DetailModel(title: .revenue, value: revenue.short))
        }
        return fetchResult
    }

    private func fetchTVShowDetails() async -> [DetailModel] {
        guard let data = await movieManager.getTVShowsDetails(id: item.id) else { return [] }
        var fetchResult: [DetailModel] = []
        if let lastData = data.lastAirDate {
            fetchResult.append(DetailModel(title: .lastAirDate, value: lastData))
        }
        if let lastEpisode = data.lastEpisodeToAir?.name {
            fetchResult.append(DetailModel(title: .lastEpisode, value: lastEpisode))
        }
        return fetchResult
    }
}
