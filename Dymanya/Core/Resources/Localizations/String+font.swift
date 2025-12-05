//
//  String+font.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 07/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import SwiftUI

// swiftlint:disable type_name
extension String {
    enum font {
        static var Light: String { .init("IBMPlexSansArabic-Light.otf") }
        static var Regular: String { .init("IBMPlexSansArabic-Regular.otf") }
        static var Medium: String { .init("IBMPlexSansArabic-Medium.otf") }
        static var Semibold: String { .init("IBMPlexSansArabic-SemiBold.otf") }
        static var Bold: String { .init("IBMPlexSansArabic-Bold.otf") }
    }
}

extension Font {
    static func light(size: CGFloat) -> Font {
        .custom(.font.Light, size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        .custom(.font.Regular, size: size)
    }

    static func medium(size: CGFloat) -> Font {
        .custom(.font.Medium, size: size)
    }

    static func semibold(size: CGFloat) -> Font {
        .custom(.font.Semibold, size: size)
    }

    static func bold(size: CGFloat) -> Font {
        .custom(.font.Bold, size: size)
    }
}
// swiftlint:enable type_name
