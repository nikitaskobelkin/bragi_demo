//
//  TVShowItemView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

// MARK: For TV show and movie better make custom generic one view, here just fast solution

struct TVShowItemView: View {
    @StateObject var viewModel: TVShowItemViewModel

    var body: some View {
        VStack(spacing: .x) {
            if let image = viewModel.image {
                RatioImageView(image: image, maxWidth: .x10)
            } else {
                IconView(name: .photo, fontSize: .x10, color: .schemeLighGray)
            }
            DescriptionLabelView(title: .title, text: viewModel.item.title)
                .multilineTextAlignment(.center)
            if let rating = viewModel.item.rating {
                DescriptionLabelView(title: .rating, text: String(rating))
            }
            if let lastDate = viewModel.lastAirDate {
                DescriptionLabelView(title: .lastAirDate, text: lastDate)
            }
            if let lastEpisode = viewModel.lastEpisodeTitle {
                DescriptionLabelView(title: .lastEpisode, text: lastEpisode)
            }
            Spacer(minLength: 0)
        }
        .isLoading(viewModel.isLoading)
        .onAppear {
            viewModel.fetchData()
        }
    }
}
