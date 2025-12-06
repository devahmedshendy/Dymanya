//
//  PodcastModel.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct PodcastModel: ContentModel {
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

    func toDomain() -> Podcast {
        Podcast(
            id: self.id,
            title: self.name,
            imageURL: self.avatar_url
        )
    }
}

struct Podcast: ContentEntity {
    let id: String
    let title: String
    let imageURL: URL
}
