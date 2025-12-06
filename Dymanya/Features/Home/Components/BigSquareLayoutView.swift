//
//  BigSquareLayoutView.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct BigSquareLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            SectionHeader(title: data.title)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: .padding) {
                    ForEach(data.items, id: \.id) { item in
                        EditorialCard(item: item)
                    }
                }
                .padding(.horizontal, .padding)
            }
        }
    }
}

private struct WideCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: item.imageURL) { phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: .fill)
                    } else {
                        Color.gray.opacity(0.1)
                    }
                }
                .frame(width: 280, height: 160)
                .cornerRadius(.cornerRadius)

                // Gradient for readability
                LinearGradient(
                    colors: [.black.opacity(0.6), .clear],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 80)
                .cornerRadius(.cornerRadius, corners: [.bottomLeft, .bottomRight])

//                if let sub = item as? HasSubtitle {
//                    Text(sub.subtitle)
//                        .font(Typography.caption)
//                        .padding(8)
//                        .foregroundStyle(.white)
//                }
            }

            Text(item.title)
                .font(Typography.cardTitle)
                .lineLimit(1)
                .foregroundStyle(.primary)
        }
        .frame(width: 280)
    }
}

struct EditorialCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: item.imageURL) { img in
                img.image?.resizable().aspectRatio(contentMode: .fill)
            }
            .frame(width: 260, height: 320) // Tall vertical editorial card
            .clipped()

            // Glass Pane
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .font(.bold(size: 16))
                        .foregroundStyle(.primary)

//                    if let sub = item as? HasSubtitle {
//                        Text(sub.subtitle)
//                            .font(.regular(size: 13))
//                            .foregroundStyle(.secondary)
//                    }
                }
                Spacer()
            }
            .padding(16)
            .background(.thickMaterial) // The "Glass" effect
        }
        .frame(width: 260, height: 320)
        .cornerRadius(Design.cardRadius)
        .shadow(color: Design.softShadow, radius: 8, x: 0, y: 4)
    }
}
