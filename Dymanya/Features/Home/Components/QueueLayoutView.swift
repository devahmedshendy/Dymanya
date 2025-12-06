//
//  TwoLinesGridLayoutView.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

struct TwoLinesGridLayoutView: SectionLayoutView {
    let data: any SectionLayout

    init(data: any SectionLayout) {
        self.data = data
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(data.title + " " + Self.identifier)
                .font(.title)

            VStack {
                ForEach(data.items, id: \.id) { item in
                    Text(item.title)
                }
            }
        }
    }
}
