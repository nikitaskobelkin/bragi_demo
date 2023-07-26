//
//  TVShowItemView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

struct MediaItemView<ViewModelType: MediaItemViewModelProtocol>: View {
    @StateObject var viewModel: ViewModelType

    var body: some View {
        VStack(spacing: .x) {
            if let image = viewModel.image {
                RatioImageView(image: image, maxWidth: .x10)
            } else {
                IconView(name: .photo, fontSize: .x10, color: .schemeLighGray)
            }
            DescriptionLabelView(title: .title, text: viewModel.item.title)
                .multilineTextAlignment(.center)
            if let rating = viewModel.item.rating, rating > 0 {
                DescriptionLabelView(title: .rating, text: String(rating))
            }
            ForEach(viewModel.details, id: \.self) { detail in
                DescriptionLabelView(title: detail.title, text: detail.value)
            }
            Spacer(minLength: 0)
        }
        .isLoading(viewModel.isLoading)
        .onAppear {
            viewModel.fetchData()
        }
    }
}
