//
//  DisconnectAlert.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import SwiftUI

// MARK: - DisconnectAlert as View's method

extension View {
    @ViewBuilder func disconnectAlert(
        isPresented: Binding<Bool>,
        title: Localization = .oops,
        text: String = Localization.connectErrorTxt.value,
        retry: @escaping () -> Void,
        cancel: @escaping () -> Void = {}
    ) -> some View {
        self
            .alert(isPresented: isPresented) {
                Alert(
                    title: Text(title),
                    message: Text(text),
                    primaryButton: .default(
                        Text(.retry),
                        action: retry
                    ),
                    secondaryButton: .destructive(
                        Text(.cancel),
                        action: cancel
                    )
                )
            }
    }
}
