//
//  SectionLayoutRenderer.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import SwiftUI
import SectionLayoutRegistry

@SectionLayoutRegistry<HomeSectionType>([
    (.square, SquareLayoutView.self),
    (.big_square, BigSquareLayoutView.self),
    (.two_lines_grid, TwoLinesGridLayoutView.self),
    (.queue, QueueLayoutView.self),
])
struct SectionLayoutRenderer: View {
    let section: HomeSection
}
