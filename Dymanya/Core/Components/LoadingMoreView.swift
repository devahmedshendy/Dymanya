//
//  LoadingMoreView.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 25/08/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import SwiftUI

struct LoadingMoreView: View {
    var body: some View {
        ProgressView(String.text.LoadingMore)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical)
    }
}
