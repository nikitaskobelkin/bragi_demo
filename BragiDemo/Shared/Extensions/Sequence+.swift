//
//  Result+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

// MARK: - Async foreach

extension Sequence {
    func forEachAsync(_ operation: (Element) async -> Void) async {
        for element in self {
            await operation(element)
        }
    }
}
