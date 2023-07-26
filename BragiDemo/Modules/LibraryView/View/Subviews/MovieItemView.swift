//
//  MovieItemView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct MovieItemView: View {
    let item: MovieItem

    var body: some View {
        VStack(spacing: .x) {
            if let image = item.image {
                RatioImageView(image: image, maxHeight: .x10)
            } else {
                IconView(name: .photo, fontSize: .x10, color: .schemeLighGray)
            }
            DescriptionLabelView(title: .title, text: item.title)
            if let rating = item.rating {
                DescriptionLabelView(title: .rating, text: String(rating))
            }
            if let budget = item.budget {
                DescriptionLabelView(title: .budget, text: String(budget))
            }
            if let revenue = item.revenue {
                DescriptionLabelView(title: .revenue, text: String(revenue))
            }
        }
    }
}
