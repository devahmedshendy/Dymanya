//
//  HomeSectionType.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

enum HomeSectionType: String, Decodable {
    case square
    case two_lines_grid = "2_lines_grid"
    case big_square
    case queue
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)

        let normalizedRawValue = rawValue
            .lowercased()
            .replacingOccurrences(
                of: "[^a-z0-9]+",
                with: "_",
                options: .regularExpression
            )
            .trimmingCharacters(in: .init(charactersIn: "_"))

        if let sectionType = HomeSectionType(rawValue: normalizedRawValue) {
            self = sectionType
            return
        }

        self = .unknown
    }
}
