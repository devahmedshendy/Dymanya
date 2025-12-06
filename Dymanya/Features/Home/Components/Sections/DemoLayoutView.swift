//
//  DemoLayoutView.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct DemoLayoutView: View {
    let identifier: String
    let data: any SectionLayout

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            Text(identifier)
                .font(.caption)
                .foregroundStyle(.gray)

            Text(data.title)
                .font(.title2)

            VStack {
                ForEach(data.items, id: \.id) { item in
                    Text(item.title)
                        .font(.body)
                }
            }
        }
    }
}
