//
//  MovieItemViewBuilder.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

struct MovieItemViewBuilder {
    static func build(item: MovieItem) -> some View {
        let viewModel = MovieItemViewModel(
            item: item,
            manager: DIContainer.shared.movieManager
        )
        return MovieItemView(viewModel: viewModel)
    }
}
