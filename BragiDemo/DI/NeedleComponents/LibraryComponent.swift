//
//  LibraryComponent.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import NeedleFoundation
import SwiftUI

protocol LibraryComponentProtocol {
    func buildView(contentType: ContentType) -> AnyView
}

protocol LibraryDependency: Dependency {
    var movieManager: MovieManagerProtocol { get }
}

final class LibraryComponent: Component<LibraryDependency>, LibraryComponentProtocol {
    func buildView(contentType: ContentType) -> AnyView {
        let viewModel: LibraryViewModel = LibraryViewModel(
            contentType: contentType,
            movieManager: dependency.movieManager
        )
        return AnyView(
            LibraryView(
                viewModel: viewModel,
                mediaItemComponent: MediaItemComponent(parent: self)
            )
        )
    }
}
