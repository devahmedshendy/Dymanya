//
//  Section.swift
//  SectionLayoutRegistry
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

public protocol SectionLayout: Identifiable, Hashable, Sendable {
    var id: String { get }
    var title: String { get }
    var items: [any SectionLayoutItem] { get }
}

extension SectionLayout {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
