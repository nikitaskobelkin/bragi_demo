//
//  FontBody.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct FontBody: ViewModifier {
    var size: CGFloat = .x2
    var color: Color = .text
    var weight: Font.Weight = .regular

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundColor(color)
    }
}
