//
//  TVShowItemViewBuilder.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

struct TVShowItemViewBuilder {
    static func build(item: MovieItem) -> some View {
        let viewModel = TVShowItemViewModel(
            item: item,
            manager: DIContainer.shared.movieManager
        )
        return TVShowItemView(viewModel: viewModel)
    }
}
