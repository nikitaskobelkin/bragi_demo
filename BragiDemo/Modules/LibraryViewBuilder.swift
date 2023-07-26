//
//  LibraryViewBuilder.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

struct LibraryViewBuilder {
    static func build(for contentType: ContentType) -> some View {
        let viewModel = LibraryViewModel(
            contentType: contentType,
            movieManager: MovieManager(networkService: NetworkService(sessionManager: .default))
        )
        return LibraryView(viewModel: viewModel)
    }
}
