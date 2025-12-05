//
//  UIApplication+extension.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 25/06/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import UIKit

extension UIApplication {
    static var isRTL: Bool {
        shared.userInterfaceLayoutDirection == .rightToLeft
    }
}

extension UIApplication {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

// MARK: Dimensions

extension UIApplication {
    private static var windowScene: UIWindowScene? {
        return shared.connectedScenes.first as? UIWindowScene
    }

    static var userInterfaceStyle: UIUserInterfaceStyle? {
        return windowScene?.screen.traitCollection.userInterfaceStyle
        ?? UIScreen.main.traitCollection.userInterfaceStyle
    }

    static var screenWidth: CGFloat {
        return windowScene?
            .screen
            .bounds
            .size
            .width ?? .zero
    }

    static var screenHeight: CGFloat {
        return windowScene?
            .screen
            .bounds
            .size
            .height ?? .zero
    }

    static var topPresentedViewController: UIViewController? {
        return windowScene?
            .windows
            .first?
            .rootViewController?
            .presentedViewController
    }

    static var safeAreaInsets: UIEdgeInsets {
        return windowScene?
            .windows
            .first?
            .safeAreaInsets ?? .zero
    }

    static var safeAreaTopHeight: CGFloat {
        return safeAreaInsets.top
    }

    static var safeAreaBottomHeight: CGFloat {
        return safeAreaInsets.bottom
    }
}
