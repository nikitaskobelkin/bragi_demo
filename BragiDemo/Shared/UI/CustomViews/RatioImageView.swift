//
//  RatioImageView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct RatioImageView: View {
    let image: Image
    var aspectRatioMode: ContentMode
    var maxHeight: CGFloat?
    var maxWidth: CGFloat?

    init(image: Image, aspectRatioMode: ContentMode = .fit, maxHeight: CGFloat? = nil, maxWidth: CGFloat? = nil) {
        self.image = image
        self.aspectRatioMode = aspectRatioMode
        self.maxHeight = maxHeight
        self.maxWidth = maxWidth
    }

    init(name: String, aspectRatioMode: ContentMode = .fit, maxHeight: CGFloat? = nil, maxWidth: CGFloat? = nil) {
        image = Image(name)
        self.aspectRatioMode = aspectRatioMode
        self.maxHeight = maxHeight
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: aspectRatioMode)
            .frame(maxWidth: maxWidth ?? .none, maxHeight: maxHeight ?? .none)
    }
}
