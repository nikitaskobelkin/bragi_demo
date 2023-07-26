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
                    ForEach(viewModel.movies, id: \.self) { item in
                        MovieItemView(item: item)
                            .onAppear {
                                guard viewModel.movies.last == item else { return }
                                viewModel.fetchMovies(genre: viewModel.selectedFilter?.title ?? "", refresh: false)
                            }
                    }
                }
                .padding(.all, .x3)
                if viewModel.isLazyLoading {
                    ProgressView()
                }
            }
        }
        .isLoading(viewModel.isLoading)
        .onChange(of: viewModel.selectedFilter) { value in
            guard let filter = value else { return }
            viewModel.fetchMovies(genre: filter.title, refresh: true)
        }
        .onAppear {
            viewModel.fetchGenres()
        }
    }
}
