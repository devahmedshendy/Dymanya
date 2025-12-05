//
//  String+fatal.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 22/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

// swiftlint:disable identifier_name
extension String.fatal {
    static var MissingImplementation: String {
        "Subclasses must provide implementation"
    }

    static func MissingBundleIdentifier(for target: AnyObject) -> String {
        "Bundle identifier is required for '\(String(describing: target))'."
    }
}
// swiftlint:enable identifier_name
