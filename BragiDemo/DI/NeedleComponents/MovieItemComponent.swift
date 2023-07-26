//
//  MediaItemComponent.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import NeedleFoundation
import SwiftUI

protocol MediaItemComponentProtocol {
    func buildView(item: MovieItem, contentType: ContentType) -> AnyView
}

protocol MediaItemDependency: Dependency {
    var movieManager: MovieManagerProtocol { get }
    var imageCacheService: ImageCacheServiceProtocol { get }
}

final class MediaItemComponent: Component<MediaItemDependency>, MediaItemComponentProtocol {
    func buildView(item: MovieItem, contentType: ContentType) -> AnyView {
        let viewModel: MediaItemViewModel = MediaItemViewModel(
            item: item,
            contentType: contentType,
            movieManager: dependency.movieManager,
            imageCacheService: dependency.imageCacheService
        )
        return AnyView(MediaItemView(viewModel: viewModel))
    }
}
