//
//  MovieItem.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct MovieItem: Hashable {
    let id: Int
    var image: Image?
    let title: String
    var rating: Float?
    var budget: Int?
    var revenue: Int?
}

extension MovieItem {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(rating)
        hasher.combine(budget)
        hasher.combine(revenue)
    }

    static func ==(lhs: MovieItem, rhs: MovieItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.rating == rhs.rating &&
        lhs.budget == rhs.budget &&
        lhs.revenue == rhs.revenue
    }
}
