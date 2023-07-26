//
//  String+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

extension Int {
    var millions: String {
        "\(self % 1000000) M"
    }
}
