//
//  ContentTypeRegistry.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

final class ContentTypeRegistry {
    static let shared = ContentTypeRegistry()

    private var db: [String: any HomeSectionContentModel.Type] = [:]

    func register<T: HomeSectionContentModel>(_ type: T.Type, for key: String) {
        db[key] = type
    }

    func findType(
        forKey key: String,
        from container: KeyedDecodingContainer<HomeSectionModel.CodingKeys>
    ) throws -> (any HomeSectionContentModel.Type)? {
        guard let targetType = db[key] else {
            warningLog("Unknown content_type '\(key)'")
            return nil
        }

        return targetType
    }
}
