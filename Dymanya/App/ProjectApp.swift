//
//  ProjectApp.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

@main
struct ProjectApp: App {

    init() {
        setupContentTypeRegistry()
    }

    var body: some Scene {
        WindowGroup {
            HomeScreen(
                controller: .init(
                    repository: HomeRepository()
                )
            )
        }
    }

    private func setupContentTypeRegistry() {
        ContentTypeRegistry.shared.register(
            PodcastModel.self, for: PodcastModel.type
        )

        ContentTypeRegistry.shared.register(
            EpisodeModel.self, for: EpisodeModel.type
        )

        ContentTypeRegistry.shared.register(
            AudioBookModel.self, for: AudioBookModel.type
        )

        ContentTypeRegistry.shared.register(
            AudioArticleModel.self, for: AudioArticleModel.type
        )
    }
}
