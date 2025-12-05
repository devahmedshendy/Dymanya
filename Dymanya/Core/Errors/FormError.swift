//
//  FormError.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 12/08/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
public enum FormError: ApplicationError {
    case ValidationError

    public var details: ErrorDetails {
        switch self {
        case .ValidationError:
            let message = String.error.InvalidForm

            return .init(
                type: self.identifier,
                message: message
            )
        }
    }
}
// swiftlint:enable identifier_name
