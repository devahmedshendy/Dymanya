//
//  Episode.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation
import SectionLayoutRegistry

struct EpisodeModel: ContentModel {
    static let type: String = "episode"

    let id: String
    let name: String
    let avatar_url: URL
    let duration: Int
    let release_date: Date

    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case name
        case avatar_url
        case duration
        case release_date
    }

    func toDomain() -> Episode {
        Episode(
            id: self.id,
            title: self.name,
            imageURL: self.avatar_url,
            duration: self.duration,
            releaseDate: self.release_date
        )
    }
}

struct Episode: SectionLayoutItem, HasDuration, HasReleaseDate {
    let id: String
    let title: String
    let imageURL: URL
    let duration: Int
    let releaseDate: Date
}
