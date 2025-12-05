//
//  HomeSectionContentModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

protocol HomeSectionContentModel: Decodable, Hashable {
    static var type: String { get }

    var id: String { get }
//    var title: String { get }
//    var imageURL: URL { get }
//    var duration: Int { get }
//    var episodeCount: Int { get }
}

extension HomeSectionContentModel {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//struct HomeSectionContent  {
//    let id: String
//    let title: String
//    let imageURL: URL
//    let duration: String
//    let episodeCount: Int
//}
