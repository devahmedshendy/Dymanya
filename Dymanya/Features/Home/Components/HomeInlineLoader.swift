//
//  HomeInlineLoader.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI

struct HomeInlineLoader: View {
    var body: some View {
        VStack(spacing: 24) {
            ProgressView()
                .controlSize(.large)
                .tint(.orange)

            Text("Preparing your library...")
                .font(.medium(size: 16))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(Color(uiColor: .systemGroupedBackground))
        .environment(\.layoutDirection, .leftToRight) // Force LTR
    }
}
