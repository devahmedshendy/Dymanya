//
//  HomeScreen.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var controller: HomeController

    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()

                switch controller.data {
                case .idle:
                    EmptyView()

                case .fresh:
                    VStack(spacing: 16) {
                        ProgressView()
                            .controlSize(.large)
                        Text(String.text.LoadingLibrary)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                case .ready(let sections):
                    readyView(data: sections)

                case .empty:
                    EmptyContentView(
                        data: .default,
                        action: controller.fetchFirstPage
                    )
                }
            }
            .navigationTitle(String.text.AppName)
            .navigationBarTitleDisplayMode(.large)

            .onAppear(perform: controller.fetchFirstPage)
        }
    }

    private func readyView(data: [HomeSection]) -> some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(data) { section in
                    SectionLayoutRenderer(section: section)
                }

                if !data.isEmpty {
                    Color.clear
                        .frame(height: 50)
                        .onAppear {
                            controller.fetchNextPage()
                        }
                }

                if controller.isLoadingMore {
                    LoadingMoreView()
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 35)
        }
    }
}
