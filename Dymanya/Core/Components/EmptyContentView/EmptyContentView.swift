//
//  EmptyContentView.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

struct EmptyContentView: View {
    let data: EmptyContentData
    let action: @MainActor () -> Void

    init(data: EmptyContentData, action: @escaping () -> Void = { }) {
        self.data = data
        self.action = action
    }

    init(data: EmptyContentData) {
        self.data = data
        self.action = {}
    }

    var body: some View {
        VStack(spacing: 12) {
            if let iconName = data.iconName {
                Image(systemName: iconName)
                    .font(.system(size: 50))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
            }

            Text(data.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text(data.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            if let actionTitle = data.actionTitle {
                Button {
                    action()
                } label: {
                    Text(actionTitle)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding(.horizontal, 40)
                .padding(.top, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
