//
//  DIContainer.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import Foundation

// MARK: This is fast solution for just 1 manager, probably better use Swinject, Needle or another DI frameworks

final class DIContainer {
    static let shared = DIContainer()
    private init () {}

    private lazy var networkService: NetworkServiceProtocol = NetworkService(sessionManager: .default)
    lazy var movieManager: MovieManagerProtocol = MovieManager(networkService: networkService)
}
