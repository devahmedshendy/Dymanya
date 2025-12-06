//
//  ContentModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

protocol ContentDomainConvertible {
    associatedtype Domain: ContentEntity
    func toDomain() -> Domain
}

protocol ContentModel: ContentDomainConvertible, Decodable, Hashable {
    static var type: String { get }

    var id: String { get }
}

extension ContentModel {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
