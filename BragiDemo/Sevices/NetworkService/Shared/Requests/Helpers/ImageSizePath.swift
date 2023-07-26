//
//  ImageSizePath.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

enum ImageSize: String {
    case original
    case w500
}

extension ImageSize {
    var path: String {
        self.rawValue + "/"
    }
}
