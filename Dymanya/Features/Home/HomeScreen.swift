//
//  HomeScreen.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI
import Combine

struct HomeScreen: View {
    @StateObject var controller: HomeController
    @State private var scrollOffset: CGFloat = 0

    // Config
    let heroHeight: CGFloat = 420
    let overlap: CGFloat = 40

    var body: some View {
        ZStack(alignment: .top) {

            // LAYER 0: Background
            Color.black.ignoresSafeArea()

            // LAYER 1: The Static Hero (Parallax & Stretchy)
            // It sits behind but reacts to 'scrollOffset'
            HomeStaticHero(scrollY: scrollOffset, height: heroHeight)
                .zIndex(0)

            // LAYER 2: The Scrollable Sheet
            ScrollView {
                VStack(spacing: 0) {

                    // A. The Transparent Gap (Window to Hero)
                    GeometryReader { proxy in
                        Color.clear
                            .preference(
                                key: ScrollOffsetKey.self,
                                value: proxy.frame(in: .named("scrollScope")).minY
                            )
                    }
                    .frame(height: heroHeight - overlap)

                    // B. The Content Sheet (Solid Background)
                    VStack(spacing: 0) {

                        // Scenario A: Loading
                        if controller.isLoading && controller.data.isEmpty {
                            HomeInlineLoader()
                                .transition(.opacity)
                        }
                        // Scenario B: Data Loaded
                        else {
                            LazyVStack(spacing: 24) {
                                ForEach(controller.data) { section in
                                    SectionLayoutRenderer(section: section)
                                        .scrollTransition(.animated.threshold(.visible(0.2))) { content, phase in
                                            content
                                                .opacity(phase.isIdentity ? 1 : 0)
                                                .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                                .offset(y: phase.isIdentity ? 0 : 30)
                                        }
                                }
                            }
                            .padding(.top, 32)
                            .padding(.bottom, 100)
                        }
                    }
                    .background(Color(uiColor: .systemGroupedBackground))
                    .clipShape(
                        RoundedCorner(radius: 32, corners: [.topLeft, .topRight])
                    )
                    .shadow(color: .black.opacity(0.15), radius: 20, y: -5)
                }
            }
            .coordinateSpace(name: "scrollScope")
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                // We track both positive (pull down) and negative (scroll up) offsets
                self.scrollOffset = value
            }
            .zIndex(1)
            .environment(\.layoutDirection, .leftToRight) // Ensure English layout if needed for list
        }
        .onAppear(perform: controller.screenDidAppear)
    }
}
