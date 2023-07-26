//
//  DIContainer.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

// MARK: - ViewsFactory Protocol

protocol ViewsFactoryProtocol {
    associatedtype Body: View
    @ViewBuilder static func build(_ module: FactoryModule) -> Body
}
