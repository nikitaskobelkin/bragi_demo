//
//  LibraryView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel: LibraryViewModel
    let mediaItemComponent: MediaItemComponentProtocol
    private let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 0),
        count: 2
    )

    var body: some View {
        VStack {
            if !viewModel.filters.isEmpty {
                FiltersView(
                    selected: $viewModel.selectedFilter,
                    filter: viewModel.filters
                )
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: .x2) {
                    ForEach(viewModel.items, id: \.self) { item in
                        mediaItemComponent.buildView(item: item, contentType: viewModel.contentType)
                            .onAppear {
                                guard viewModel.items.last == item else { return }
                                viewModel.fetchMovies(refresh: false)
                            }
                    }
                }
                .padding(.all, .x3)
                if viewModel.isLazyLoading {
                    ProgressView()
                }
            }
            .onRefresh {
                guard !viewModel.isLoading else { return }
                viewModel.fetchMovies(refresh: true)
            }
        }
        .isLoading(viewModel.isLoading)
        .onChange(of: viewModel.selectedFilter) { _ in
            viewModel.fetchMovies(refresh: true)
        }
        .onAppear {
            viewModel.fetchGenres()
        }
    }
}
