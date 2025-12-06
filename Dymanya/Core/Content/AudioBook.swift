//
//  AudioBookModel.swift
//  Dymanya
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
            imageURL: self.avatar_url
        )
    }
}

struct AudioBook: SectionLayoutItem {
    let id: String
    let title: String
    let imageURL: URL
}
