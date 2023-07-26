//
//  BragiDemoApp.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

@main
struct BragiDemoApp: App {
    private let manager = MovieManager(networkService: NetworkService(sessionManager: .default))
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
