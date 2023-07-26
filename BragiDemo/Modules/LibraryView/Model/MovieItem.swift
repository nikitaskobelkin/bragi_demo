//
//  MovieItem.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct MovieItem: Hashable {
    let id: Int
    let imagePath: String?
    let title: String
    let rating: Double?
}

extension MovieItem {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(rating)
    }

    static func ==(lhs: MovieItem, rhs: MovieItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.rating == rhs.rating
    }
}
