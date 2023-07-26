//
//  DescriptionLabelView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct DescriptionLabelView: View {
    let title: Localization
    let text: String

    var body: some View {
        Text("\(title.value): \(text)").modifier(FontBody())
    }
}
