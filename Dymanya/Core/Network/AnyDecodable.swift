//
//  AnyDecodable.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 15/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import Foundation

// swiftlint:disable statement_position
struct AnyDecodable: Decodable {
    let value: Any

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if container.decodeNil() { self.value = NSNull() }
        else if let value = try? container.decode(Bool.self) { self.value = value }
        else if let value = try? container.decode(Int.self) { self.value = value }
        else if let value = try? container.decode(Double.self) { self.value = value }
        else if let value = try? container.decode(String.self) { self.value = value }
        else if let value = try? container.decode([AnyDecodable].self) { self.value = value.map { $0.value } }
        else if let value = try? container.decode([String: AnyDecodable].self) {
            self.value = value.mapValues { $0.value }
        }

        else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot decode value of type \(String(describing: type(of: container)))"
            )
        }
    }
}
// swiftlint:enable statement_position
