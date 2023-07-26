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
            movieManager: DIContainer.shared.movieManager
        )
        return LibraryView(viewModel: viewModel)
    }
}
