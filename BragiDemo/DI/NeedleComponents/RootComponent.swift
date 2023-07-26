//
//  RootComponent.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import NeedleFoundation
import SwiftUI

final class RootComponent: BootstrapComponent {
    private lazy var networkService: NetworkServiceProtocol = {
        return NetworkService(sessionManager: .default)
    }()

    var movieManager: MovieManagerProtocol {
        shared { MovieManager(networkService: networkService) }
    }

    var imageCacheService: ImageCacheServiceProtocol {
        shared { ImageCacheService() }
    }

    var rootView: some View {
        RootView(
            libraryComponent: LibraryComponent(parent: self)
        )
    }
}
