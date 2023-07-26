//
//  FactoryModule.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

// MARK: - List of modules

enum FactoryModule {
    case root
    case library(_ type: ContentType)
    case tvItem(item: MovieItem)
    case movieItem(item: MovieItem)
}
