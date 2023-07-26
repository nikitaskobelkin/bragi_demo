//
//  ScrollView+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI
import SwiftUIIntrospect

extension ScrollView {
    @ViewBuilder func onRefresh(_ action: @escaping () async -> Void) -> some View {
        if #available(iOS 15.0, *) {
            self.refreshable {
                await action()
            }
        } else {
            // MARK: Instead of instrospect we should create specific Wrapper for UIScrollView using UIKIt, in this task I don't have time for it, that's why I'm using Introspect for short simulate case
            self.introspect(.scrollView, on: .iOS(.v14), scope: .ancestor) { scrollView in
                Task { @MainActor in
                    scrollView.refreshControl = UIRefreshControl()
                    await action()
                    scrollView.refreshControl?.endRefreshing()
                }
            }
        }
    }
}
