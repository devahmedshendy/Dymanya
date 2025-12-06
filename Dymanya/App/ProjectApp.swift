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
        ContentModelRegistry.shared.register(
            PodcastModel.self, for: PodcastModel.type
        )

        ContentModelRegistry.shared.register(
            EpisodeModel.self, for: EpisodeModel.type
        )

        ContentModelRegistry.shared.register(
            AudioBookModel.self, for: AudioBookModel.type
        )

        ContentModelRegistry.shared.register(
            AudioArticleModel.self, for: AudioArticleModel.type
        )
    }
}
