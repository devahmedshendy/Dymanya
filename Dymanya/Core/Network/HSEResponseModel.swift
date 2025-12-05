//
//  HSEResponseModel.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 17/02/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import Foundation

struct HSEResponseModel<DataModel: Decodable>: APIResponse {
    let status: Int
    let message: String
    let validations: [String: String]
    let data: DataModel?

    enum CodingKeys: CodingKey {
        case status
        case message
        case data

        case errors
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeStatus(forKey: .status)

        let (message, validations) = try container.decodeMessageWithValidations(
            messageKey: .message,
            errorsKey: .errors
        )
        self.message = message
        self.validations = validations

        self.data = try container.decodeIfPresent(DataModel.self, forKey: .data)
    }
}

extension KeyedDecodingContainer {
    func decodeStatus(
        forKey key: KeyedDecodingContainer<K>.Key
    ) throws -> Int {
        return if let status = try? self.decode(String.self, forKey: key),
            let status = Int(status) {
            status
        } else {
            try self.decode(Int.self, forKey: key)
        }
    }

    func decodeMessageWithValidations(
        messageKey: KeyedDecodingContainer<K>.Key,
        errorsKey: KeyedDecodingContainer<K>.Key
    ) throws -> (message: String, validations: [String: String]) {
        if let errorsObj = try? self.decodeIfPresent(
            [String: [String]].self,
            forKey: errorsKey
        ) {
            let message = String.error.InvalidForm
            let validations = errorsObj.mapValues { $0.mapErrorList() }

            return (message, validations)

        } else {
            let validations = [String: String]()
            var message = ""

            if let errors = try? self.decodeIfPresent([String].self, forKey: errorsKey) {
                message = errors.mapErrorList()

            } else if let error = try? self.decodeIfPresent(String.self, forKey: errorsKey) {
                message = error

            } else {
                message = try self.decode(String.self, forKey: messageKey)
            }

            return (message, validations)
        }
    }
}

// MARK: Helpers

extension Array where Element == String {
    func mapErrorList() -> String {
        self.compactMap { $0 }.joined(separator: "\n")
    }
}
