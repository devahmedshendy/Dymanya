//
//  SectionHeader.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.bold(size: 24))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, Design.pagePadding)
    }
}
