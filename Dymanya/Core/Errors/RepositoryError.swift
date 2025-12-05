//
//  ViewError.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 09/07/2024.
//

import Foundation

// swiftlint:disable identifier_name
public enum RepositoryError: ApplicationError {
    case MappingError(_ debugMessage: String)

    public var details: ErrorDetails {
        switch self {
        case .MappingError(let debugMessage):
            let message = String.error.Unknown

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )
        }
    }
}
// swiftlint:enable identifier_name
