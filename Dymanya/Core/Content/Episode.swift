//
//  Episode.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct EpisodeModel: HomeSectionContentModel {
    static let type: String = "episode"

    let id: String
    let name: String
    let avatar_url: URL
    let audio_url: URL
    let duration: Int
    let release_date: Date

    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case name
        case avatar_url
        case audio_url
        case duration
        case release_date
    }

//    var title: String { name }
//    var imageURL: URL { avatar_url }
//    var episodeCount: Int { episode_count }
}

//extension HomeSectionContent {
//    init(from model: EpisodeModel) {
//        self.id = model.id
//        self.title = model.name
//        self.imageURL = model.avatar_url
//        self.episodeCount = model.episode_count
//        self.duration = "\(model.duration)"
//    }
//}
