//
//  AudioBookModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct AudioBookModel: HomeSectionContentModel {
    static let type: String = "audio_book"

    let id: String
    let name: String
    let avatar_url: URL
    let release_date: Date
    let duration: Int

    enum CodingKeys: String, CodingKey {
        case id = "audiobook_id"
        case name
        case avatar_url
        case release_date
        case duration
    }

//    var title: String { name }
//    var imageURL: URL { avatar_url }
//    var episodeCount: Int { episode_count }
}

//extension HomeSectionContent {
//    init(from model: AudioBookModel) {
//        self.id = model.id
//        self.title = model.name
//        self.imageURL = model.avatar_url
//        self.episodeCount = model.episode_count
//        self.duration = "\(model.duration)"
//    }
//}
