//
//  RootView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct RootView: View {
    let libraryComponent: LibraryComponentProtocol

    var body: some View {
        TabView {
            libraryComponent.buildView(contentType: .movies)
                .tabItem {
                    Label(Localization.movie.value, systemImage: "film")
                }
            libraryComponent.buildView(contentType: .tv)
                .tabItem {
                    Label(Localization.movie.value, systemImage: "play.tv")
                }
        }
    }
}
