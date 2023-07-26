//
//  DisabledModifier.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct Disabled: ViewModifier {
    var disabled: Bool

    func body(content: Content) -> some View {
        content
            .opacity(disabled ? 0.4 : 1)
            .disabled(disabled)
    }
}
