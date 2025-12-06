//
//  AudioBookModel.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation
import SectionLayoutRegistry

struct AudioBookModel: ContentModel {
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

    func toDomain() -> AudioBook {
        AudioBook(
            id: self.id,
            title: self.name,
            imageURL: self.avatar_url,
            duration: self.duration,
            releaseDate: self.release_date
        )
    }
}

struct AudioBook: SectionLayoutItem, HasDuration, HasReleaseDate {
    let id: String
    let title: String
    let imageURL: URL
    let duration: Int
    let releaseDate: Date
}
