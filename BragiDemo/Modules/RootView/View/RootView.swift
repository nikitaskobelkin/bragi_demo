//
//  RootView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            ViewsFactory.build(.library(.movies))
                .tabItem {
                    Label(Localization.movie.value, systemImage: "film")
                }
            ViewsFactory.build(.library(.tv))
                .tabItem {
                    Label(Localization.movie.value, systemImage: "play.tv")
                }
        }
    }
}
