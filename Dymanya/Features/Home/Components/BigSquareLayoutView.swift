//
//  SquareLayoutView.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct SquareLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(data.title + " " + Self.identifier)

            VStack {
                ForEach(data.items, id: \.id) { item in
                    Text(item.title)
                }
            }
        }
    }
}
