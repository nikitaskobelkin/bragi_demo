//
//  MoviesListView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

struct MoviesListView: View {
    let items: [MovieItem]
    let onAppear: () -> Void

    var body: some View {
        ForEach(items, id: \.self) { item in
            ViewsFactory.build(.movieItem(item: item))
                .onAppear {
                    guard items.last == item else { return }
                    onAppear()
                }
        }
    }
}
