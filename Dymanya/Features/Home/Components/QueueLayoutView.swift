//
//  QueueLayoutView.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI

struct QueueLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

//    var body: some View {
//        VStack(alignment: .leading, spacing: .spacing) {
//            SectionHeader(title: data.title)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: .padding) {
//                    ForEach(data.items, id: \.id) { item in
//                        ImmersiveHeroCard(item: item)
//                    }
//                }
//                .padding(.horizontal, .padding)
//                // Add bottom padding for shadow clipping
//                .padding(.bottom, 20)
//            }
//        }
//    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeader(title: data.title)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(data.items, id: \.id) { item in
                        ImmersiveHeroCard(item: item)
                    }
                }
                .padding(.horizontal, Design.pagePadding)
                .padding(.bottom, 20) // Space for shadow
            }
        }
    }
}

private struct HeroCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        HStack(spacing: 0) {
            // Image
            AsyncImage(url: item.imageURL) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                } else {
                    Color.gray.opacity(0.1)
                }
            }
            .frame(width: 110)
            .clipped()

            // Content
            VStack(alignment: .leading, spacing: 6) {
//                if let sub = item as? HasSubtitle {
//                    Text(sub.subtitle)
//                        .font(Typography.caption)
//                        .foregroundStyle(.blue)
//                }

                Text(item.title)
                    .font(Typography.heroTitle)
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(.primary)

                Spacer()

                HStack {
                    if let dur = item as? HasDuration {
                        Label(dur.durationDisplay, systemImage: "clock")
                            .font(Typography.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(Color.primary)
                }
            }
            .padding(16)
            .frame(height: 140)
        }
        .frame(width: 320, height: 140)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(.cornerRadius)
        .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
    }
}


struct ImmersiveHeroCard: View {
    let item: any SectionLayoutItem

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 1. Full Bleed Image
            AsyncImage(url: item.imageURL) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                } else {
                    Color.gray.opacity(0.2)
                }
            }
            .frame(width: 320, height: 200)
//            .overlay(
//                // 2. Cinematic Gradient Overlay
//                LinearGradient(
//                    colors: [.black.opacity(0.8), .transparent],
//                    startPoint: .bottom,
//                    endPoint: .top
//                )
//            )
            .cornerRadius(Design.cardRadius)

            // 3. Floating Content
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 6) {
//                    if let sub = item as? HasSubtitle {
//                        Text(sub.subtitle.uppercased())
//                            .font(.medium(size: 10))
//                            .kerning(1)
//                            .padding(.horizontal, 8)
//                            .padding(.vertical, 4)
//                            .background(.ultraThinMaterial)
//                            .cornerRadius(4)
//                            .foregroundColor(.white)
//                    }

                    Text(item.title)
                        .font(.bold(size: 18))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .shadow(radius: 4)

                    if let dur = item as? HasDuration {
                        Text("Remaining: \(dur.durationDisplay)")
                            .font(.regular(size: 12))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }

                Spacer()

                // 4. Glassmorphism Play Button
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 48, height: 48)
                    .overlay(
                        Image(systemName: "play.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .offset(x: 2) // Optical center
                    )
            }
            .padding(16)
        }
        .frame(width: 320, height: 200)
        .shadow(color: Design.floatingShadow, radius: 12, x: 0, y: 8)
    }
}
