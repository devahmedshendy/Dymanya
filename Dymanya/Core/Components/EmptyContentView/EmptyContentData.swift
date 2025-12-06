//
//  EmptyContentData.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct EmptyContentData {
    let title: String
    let description: String
    let iconName: String?
    let actionTitle: String?

    init(
        title: String,
        description: String,
        iconName: String? = nil,
        actionTitle: String? = nil
    ) {
        self.title = title
        self.description = description
        self.iconName = iconName
        self.actionTitle = actionTitle
    }
}

extension EmptyContentData {
    static var `default`: Self {
        .init(
            title: .empty.NoAvailableContent,
            description: .empty.NoAvailableContentDescription,
            iconName: "exclamationmark.triangle",
            actionTitle: .button.TryAgain
        )
    }
}
