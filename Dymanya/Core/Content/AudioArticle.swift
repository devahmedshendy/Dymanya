//
//  AudioArticleModel.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation
import SectionLayoutRegistry

struct AudioArticleModel: ContentModel {
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

    func toDomain() -> AudioArticle {
        AudioArticle(
            id: self.id,
            title: self.name,
            imageURL: self.avatar_url
        )
    }
}

struct AudioArticle: SectionLayoutItem {
    let id: String
    let title: String
    let imageURL: URL
}
