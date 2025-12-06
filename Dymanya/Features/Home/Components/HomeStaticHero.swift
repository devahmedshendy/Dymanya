//
//  HomeStaticHero.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI

struct HomeStaticHero: View {
    let scrollY: CGFloat
    let height: CGFloat

    var body: some View {
        // 1. Pull Down Logic (Stretchy)
        // If scrollY > 0 (pulling down), we increase height and zoom
        let pullDownZoom = max(1, 1 + (scrollY / 500))
//        let pullDownOffset = max(0, scrollY * 0.5) // Move down slightly when pulling

        // 2. Scroll Up Logic (Parallax Fade)
        // If scrollY < 0 (scrolling up), we fade out and move up slowly
        let parallaxOffset = min(0, scrollY * 0.5) // Move up at half speed of scroll
        let fadeOpacity = max(0, 1 + (scrollY / 300))

        ZStack(alignment: .bottomLeading) {

            // Brand Gradient
            LinearGradient(
                colors: [Color(red: 0.9, green: 0.35, blue: 0.1), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .overlay(
                Circle()
                    .fill(.white.opacity(0.1))
                    .frame(width: 400)
                    .offset(x: 100, y: -100)
                    .blur(radius: 60)
            )

            // Text Content (English / LTR)
            VStack(alignment: .leading, spacing: 12) {
                Text("Good Morning")
                    .font(.custom("IBMPlexSansArabic-Medium", size: 20))
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .cornerRadius(8)

                Text("Welcome to Dynamya")
                    .font(.custom("IBMPlexSansArabic-Bold", size: 36))
                    .foregroundStyle(.white)
                    .shadow(radius: 10)

                Text("Documentaries, Podcasts, and Audiobooks.")
                    .font(.custom("IBMPlexSansArabic-Light", size: 18))
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 60 + overlapCompensation) // Ensure text isn't covered initially
            .opacity(fadeOpacity) // Only apply fade to text

        }
        // Frame logic for "Stretchy Header"
        .frame(height: height + (scrollY > 0 ? scrollY : 0)) // Grow height on pull
        .scaleEffect(scrollY > 0 ? pullDownZoom : 1, anchor: .center) // Zoom on pull
        .offset(y: scrollY > 0 ? -scrollY/2 : parallaxOffset) // Position adjustments
        .ignoresSafeArea()
        .environment(\.layoutDirection, .leftToRight) // Force LTR
    }

    // Helper to keep text visible above the sheet overlap
    private var overlapCompensation: CGFloat {
        return 40
    }
}
