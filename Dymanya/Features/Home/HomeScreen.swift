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
            Text("HomeScreen")
                .font(.largeTitle)

            VStack(spacing: 16) {
                ForEach(controller.data) { item in
                    SectionRenderer(section: item)
                }
            }
        }
        .onAppear(perform: controller.screenDidAppear)
    }
}
