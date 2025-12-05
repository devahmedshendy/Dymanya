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
        Text("HomeScreen")
            .onAppear(perform: controller.screenDidAppear)
    }
}
