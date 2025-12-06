//
//  HomeScreen.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var controller: HomeController
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ForEach(controller.data) { item in
                    SectionLayoutRenderer(section: item)
                }
            }
            .padding(.top)
            .padding(.bottom, 50)
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .onAppear(perform: controller.screenDidAppear)
    }
}
