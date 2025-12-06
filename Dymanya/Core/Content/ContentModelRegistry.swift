//
//  ContentModelRegistry.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

final class ContentModelRegistry {
    static let shared = ContentModelRegistry()

    private var db: [String: any ContentModel.Type] = [:]

    func register<T: ContentModel>(_ type: T.Type, for key: String) {
        db[key] = type
    }

    func findType(forKey key: String) throws -> (any ContentModel.Type)? {
        guard let targetType = db[key] else {
            warningLog("Unknown content_type '\(key)'")
            return nil
        }

        return targetType
    }
}
