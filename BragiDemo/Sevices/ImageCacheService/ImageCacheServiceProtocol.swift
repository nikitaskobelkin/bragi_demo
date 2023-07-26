//
//  ImageCacheServiceProtocol.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 26/07/2023.
//

import SwiftUI

protocol ImageCacheServiceProtocol {
    func insertImage(_ image: UIImage?, for url: String)
    func removeImage(for url: String)
    func image(for url: String) -> UIImage?
}
