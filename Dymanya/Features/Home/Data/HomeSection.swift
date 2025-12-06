//
//  HomeSection.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation
import SectionLayoutRegistry

struct HomeSection: SectionLayout {
    let id = UUID().uuidString
    let type: HomeSectionType
    let title: String
    let items: [any SectionLayoutItem]
}
