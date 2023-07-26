//
//  Text+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

extension Text {
    init(_ localizationValue: Localization) {
        self.init(localizationValue.value)
    }
}
