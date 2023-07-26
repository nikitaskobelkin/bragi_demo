//
//  FilterButtonStyle.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

// MARK: - Primary Button Style

struct FilterButton: ButtonStyle {
    let isActive: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, .x)
            .padding(.horizontal, .x2)
            .background(isActive ? Color.schemeGray : .schemeLighGray)
            .foregroundColor(isActive ? .textInvert : .text)
            .cornerRadius(.infinity)
    }
}
