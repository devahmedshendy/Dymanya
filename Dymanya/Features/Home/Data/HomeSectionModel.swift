//
//  HomeSectionModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct HomeSectionModel: Decodable {
    let name: String
    let type: HomeSectionType
    let content_type: String
    let content: [any ContentModel]
    let order: Int

    enum CodingKeys: CodingKey {
        case name
        case type
        case content
        case content_type
        case order
    }

    init(from decoder: Decoder) throws {
        func decodeConcrete<T: ContentModel>(
            _ type: T.Type,
            from container: KeyedDecodingContainer<HomeSectionModel.CodingKeys>
        ) throws -> [T] {
            try container.decode([T].self, forKey: .content)
        }

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(HomeSectionType.self, forKey: .type)
        self.order = try container.decode(Int.self, forKey: .order)

        self.content_type = try container.decode(String.self, forKey: .content_type)

        guard let type = try ContentModelRegistry.shared.findType(forKey: content_type)
        else {
            self.content = []
            return
        }

        self.content = try decodeConcrete(type, from: container)
    }
}

extension HomeSectionModel {
    func toDomain() -> HomeSection {
        .init(
            type: self.type,
            title: self.name,
            items: self.content.map { $0.toDomain() }
        )
    }
}
