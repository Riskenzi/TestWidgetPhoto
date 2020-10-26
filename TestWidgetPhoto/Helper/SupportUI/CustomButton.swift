//
//  CustomButton.swift
//  PhotoWidgetDemo
//
//  Created by Valerii Melnykov on 26.10.2020.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    var fadeOnPress = true

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed && fadeOnPress ? 0.75 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

