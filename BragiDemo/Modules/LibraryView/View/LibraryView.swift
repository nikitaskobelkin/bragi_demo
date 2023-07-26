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
                    selected: $viewModel.selectedFilter,
                    filter: viewModel.filters
                )
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: .x2) {
                    switch viewModel.contentType {
                    case .movies:
                        MoviesListView(
                            items: viewModel.items,
                            onAppear: {
                                viewModel.fetchMovies(refresh: false)
                            }
                        )
                    case .tv:
                        TVListView(
                            items: viewModel.items,
                            onAppear: {
                                viewModel.fetchMovies(refresh: false)
                            }
                        )
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
