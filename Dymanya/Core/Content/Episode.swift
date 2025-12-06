//
//  Episode.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

struct EpisodeModel: ContentModel {
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

    func toDomain() -> Episode {
        Episode(
            id: self.id,
            title: self.name,
            imageURL: self.avatar_url
        )
    }
}

struct Episode: ContentEntity {
    let id: String
    let title: String
    let imageURL: URL
}
