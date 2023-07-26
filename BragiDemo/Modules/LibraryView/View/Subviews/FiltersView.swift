//
//  FiltersView.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

struct FiltersView: View {
    @Binding var selected: FilterItem?
    let filter: [FilterItem]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: .x2) {
                ForEach(filter, id: \.self) { filter in
                    Button(filter.title) {
                        selected = filter
                    }
                    .buttonStyle(FilterButton(isActive: filter == selected))
                }
            }
            .padding(.all, .x2)
        }
        .background(Color.cloud)
    }
}
