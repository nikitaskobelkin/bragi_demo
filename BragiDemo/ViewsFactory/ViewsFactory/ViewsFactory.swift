//
//  ViewsFactory.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

// MARK: - Views Factory

struct ViewsFactory: ViewsFactoryProtocol {
    @ViewBuilder static func build(_ module: FactoryModule) -> some View {
        switch module {
        case .root:
            RootViewBuilder.build()
        case .library(let contentType):
            LibraryViewBuilder.build(for: contentType)
        }
    }
}
