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
            Text("1")
                .tabItem {
                    Label(Localization.movie.value, systemImage: "film")
                }
            Text("2")
                .tabItem {
                    Label(Localization.movie.value, systemImage: "play.tv")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
