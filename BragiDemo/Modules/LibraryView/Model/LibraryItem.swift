//
//  LibraryItem.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct LibraryItem: Hashable {
    let id: Int
    let image: Image?
    let title: String
    let rating: Float?
    let budget: Int?
    let revenue: Int?
}

extension LibraryItem {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(rating)
        hasher.combine(budget)
        hasher.combine(revenue)
    }

    static func ==(lhs: LibraryItem, rhs: LibraryItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.rating == rhs.rating &&
        lhs.budget == rhs.budget &&
        lhs.revenue == rhs.revenue
    }
}
