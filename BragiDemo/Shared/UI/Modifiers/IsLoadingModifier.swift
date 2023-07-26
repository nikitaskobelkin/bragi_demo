//
//  IsLoadingModifier.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

// MARK: - View's methods

extension View {
    @ViewBuilder func isLoading(_ isLoading: Bool) -> some View {
        self.modifier(IsLoadingModifier(isLoading: isLoading))
    }
}

// MARK: - Implementation Modifiers

private struct IsLoadingModifier: ViewModifier {
    var isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .modifier(Disabled(disabled: isLoading))
            if isLoading {
                ProgressView()
            }
        }
    }
}
