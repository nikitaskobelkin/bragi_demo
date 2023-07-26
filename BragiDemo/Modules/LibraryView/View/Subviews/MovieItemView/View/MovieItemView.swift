//
//  MovieItemView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct MovieItemView: View {
    @StateObject var viewModel: MovieItemViewModel

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
            if let budget = viewModel.budget, budget > 0 {
                DescriptionLabelView(title: .budget, text: budget.short)
            }
            if let revenue = viewModel.revenue, revenue > 0 {
                DescriptionLabelView(title: .revenue, text: revenue.short)
            }
            Spacer(minLength: 0)
        }
        .isLoading(viewModel.isLoading)
        .onAppear {
            viewModel.fetchData()
        }
    }
}
