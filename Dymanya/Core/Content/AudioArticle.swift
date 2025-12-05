//
//  AudioArticleModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct AudioArticleModel: HomeSectionContentModel {
    static let type: String = "audio_article"

    let id: String
    let name: String
    let avatar_url: URL
    let release_date: Date

    enum CodingKeys: String, CodingKey {
        case id = "article_id"
        case name
        case avatar_url
        case release_date
    }

//    var title: String { name }
//    var imageURL: URL { avatar_url }
//    var episodeCount: Int { episode_count }
}

//extension HomeSectionContent {
//    init(from model: AudioArticleModel) {
//        self.id = model.id
//        self.title = model.name
//        self.imageURL = model.avatar_url
//        self.episodeCount = model.episode_count
//        self.duration = "\(model.duration)"
//    }
//}
