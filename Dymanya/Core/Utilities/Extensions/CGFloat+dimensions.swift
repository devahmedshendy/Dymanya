//
//  CGFloat+dimensions.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 25/06/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import UIKit

public extension CGFloat {
    private static let targetWidth: CGFloat = 375
    static func responsive(_ value: CGFloat) -> CGFloat {
        return value * screenWidth / targetWidth
    }

    static func responsive(_ value: CGFloat?) -> CGFloat? {
        guard let value = value else { return nil }

        return value * screenWidth / targetWidth
    }

    static func responsiveRounded(_ value: CGFloat) -> CGFloat {
        return (value * screenWidth / targetWidth).rounded()
    }
}

extension CGFloat {
    static var screenWidth: CGFloat { UIApplication.screenWidth }
    static var screenHeight: CGFloat { UIApplication.screenHeight }
    static var topSafeAreaHeight: CGFloat { UIApplication.safeAreaTopHeight }
}

extension CGFloat {
    static let cornerRadius: CGFloat = 12
    static let padding: CGFloat = 16
    static let spacing: CGFloat = 12

    static var textFieldCornerRadius: CGFloat { .responsive(10) }
    static var textFieldHorizontalPadding: CGFloat { 16 }
    static var textFieldVerticalPadding: CGFloat { 18 }
    static var textFieldIconWidth: CGFloat { 16 }
    static var textFieldIconHeight: CGFloat { .textFieldIconWidth }
}
