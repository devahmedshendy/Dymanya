//
//  TwoLinesGridLayoutView.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct TwoLinesGridLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

    let rows = [
        GridItem(.fixed(90), spacing: 12),
        GridItem(.fixed(90), spacing: 12)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            SectionHeader(title: data.title)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: .padding) {
                    ForEach(data.items, id: \.id) { item in
                        CompactRowCard(item: item)
                    }
                }
                .padding(.horizontal, .padding)
                .padding(.bottom, 10)
            }
        }
    }
}

private struct CompactRowCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: item.imageURL) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                } else {
                    Color.gray.opacity(0.1)
                }
            }
            .frame(width: 72, height: 72)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(Typography.subheadline) // Slightly smaller for dense grid
                    .lineLimit(2)
                    .foregroundStyle(.primary)

//                if let sub = item as? HasSubtitle {
//                    Text(sub.subtitle)
//                        .font(Typography.caption)
//                        .foregroundStyle(.secondary)
//                        .lineLimit(1)
//                }
            }
            Spacer()
        }
        .frame(width: 280)
        .padding(8)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(10)
    }
}

struct NativeListCell: View {
    let item: any SectionLayoutItem

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: item.imageURL) { img in
                img.image?.resizable().aspectRatio(contentMode: .fill)
            }
            .frame(width: 70, height: 70)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary.opacity(0.05), lineWidth: 1)
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.medium(size: 15))
                    .lineLimit(2)
                    .foregroundStyle(.primary)

                HStack(spacing: 6) {
                    if let dur = item as? HasDuration {
                        Text(dur.durationDisplay)
                    }
//                    if item is HasSubtitle {
//                        Text("•")
//                        Text((item as! HasSubtitle).subtitle)
//                    }
                }
                .font(.regular(size: 12))
                .foregroundStyle(.secondary)
                .lineLimit(1)
            }
            Spacer()

            // Action Icon
            Image(systemName: "ellipsis")
                .font(.system(size: 14))
                .foregroundStyle(.tertiary)
        }
        .frame(width: 300)
        .padding(8)
        .background(Color.secondarySurface.opacity(0.5)) // Very subtle background
        .cornerRadius(10)
    }
}
