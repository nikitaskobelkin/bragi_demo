//
//  LocalizationKeys.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

enum Localization: String {
    case movie
    case tv
}

// MARK: - Localization value

extension Localization {
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
