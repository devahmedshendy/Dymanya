//
//  PodcastModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct PodcastModel: HomeSectionContentModel {
    static let type: String = "podcast"

    let id: String
    let name: String
    let avatar_url: URL
    let episode_count: Int
    let duration: Int

    enum CodingKeys: String, CodingKey {
        case id = "podcast_id"
        case name
        case avatar_url
        case episode_count
        case duration
    }

//    var title: String { name }
//    var imageURL: URL { avatar_url }
//    var episodeCount: Int { episode_count }
}

//extension HomeSectionContent {
//    init(from model: PodcastModel) {
//        self.id = model.id
//        self.title = model.name
//        self.imageURL = model.avatar_url
//        self.episodeCount = model.episode_count
//        self.duration = "\(model.duration)"
//    }
//}
