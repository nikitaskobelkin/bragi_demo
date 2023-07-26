//
//  LibraryView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel: LibraryViewModel
    private let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 0), count: 2)

    var body: some View {
        VStack {
            if !viewModel.filters.isEmpty {
                FiltersView(
                    selected: $viewModel.selected,
                    filter: viewModel.filters
                )
            }
            ScrollView {
                LazyVGrid(columns: columns) {
//                    ForEach(, id: \.self) {
//                        LibraryItemView(item: $0)
//                    }
                }
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}
