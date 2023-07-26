//
//  TVShowItemViewModel.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

final class TVShowItemViewModel: ObservableObject {
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var image: Image?
    @Published private(set) var lastAirDate: String?
    @Published private(set) var lastEpisodeTitle: String?
    let item: MovieItem
    private let manager: MovieManagerProtocol


    init(item: MovieItem, manager: MovieManagerProtocol) {
        self.item = item
        self.manager = manager
    }

    func fetchData() {
        guard let path = item.imagePath else { return }
        isLoading = true
        Task { @MainActor in
            if let response = await manager.getMoviesPreview(previewPath: path),
               let uiImage = UIImage(data: response) {
                image = Image(uiImage: uiImage)
            }
            if let details = await manager.getTVShowsDetails(id: item.id) {
                lastAirDate = details.lastAirDate
                lastEpisodeTitle = details.lastEpisodeToAir?.name
            }
            isLoading = false
        }
    }
}
