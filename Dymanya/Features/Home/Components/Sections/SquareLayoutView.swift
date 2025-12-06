//
//  SquareLayoutView.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct SquareLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            SectionHeader(title: data.title)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: .padding) {
                    ForEach(data.items, id: \.id) { item in
                        CleanVerticalCard(item: item)
                    }
                }
                .padding(.horizontal, .padding)
            }
        }
    }
}

private struct StandardVerticalCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image Container
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: item.imageURL) { phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: .fill)
                    } else {
                        Color.gray.opacity(0.1)
                    }
                }
                .frame(width: 150, height: 150)
                .cornerRadius(.cornerRadius)

                // Duration Badge
                if let dur = item as? HasDuration {
                    Text(dur.durationDisplay)
                        .font(Typography.micro)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(.ultraThinMaterial)
                        .cornerRadius(4)
                        .padding(6)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(Typography.cardTitle)
                    .lineLimit(2, reservesSpace: true)
                    .foregroundStyle(.primary)

//                if let sub = item as? HasSubtitle {
//                    Text(sub.subtitle)
//                        .font(Typography.subheadline)
//                        .foregroundStyle(.secondary)
//                        .lineLimit(1)
//                }

                if let date = item as? HasReleaseDate {
                    Text(date.releaseDateDisplay)
                        .font(Typography.caption)
                        .foregroundStyle(.tertiary)
                }
            }
        }
        .frame(width: 150)
    }
}

struct CleanVerticalCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Artwork with subtle shadow
            AsyncImage(url: item.imageURL) { img in
                img.image?.resizable().aspectRatio(contentMode: .fill)
            }
            .frame(width: 140, height: 140)
            .cornerRadius(12)
            .shadow(color: Design.softShadow, radius: 4, x: 0, y: 2)

            // Typography Hierarchy
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.semibold(size: 15))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

//                if let sub = item as? HasSubtitle {
//                    Text(sub.subtitle)
//                        .font(.regular(size: 13))
//                        .foregroundStyle(.secondary)
//                        .lineLimit(1)
//                }

                if let date = item as? HasReleaseDate {
                    Text(date.releaseDateDisplay)
                        .font(.light(size: 12))
                        .foregroundStyle(.tertiary)
                        .padding(.top, 2)
                }
            }
        }
        .frame(width: 140)
    }
}

