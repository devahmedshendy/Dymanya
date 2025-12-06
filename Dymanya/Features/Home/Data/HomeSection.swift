//
//  HomeSection.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

struct HomeSection: Identifiable {
    let id = UUID()
    let type: HomeSectionType
    let title: String
    let items: [any ContentEntity]
}
