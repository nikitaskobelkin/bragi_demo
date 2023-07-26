//
//  String+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

extension Int {
    var short: String {
        let cut = 1000000
        if self / cut > 0 {
            return "\(self / 1000000) M"
        } else {
            return "\(self / 1000) K"
        }
    }
}
