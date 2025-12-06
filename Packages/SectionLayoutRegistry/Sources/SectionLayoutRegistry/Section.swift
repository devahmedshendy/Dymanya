//
//  Section.swift
//  SectionLayoutRegistry
//
//  Created by Ahmed Shendy on 06/12/2025.
//


public protocol Section: Identifiable, Sendable {
    var title: String { get }
    var items: [any SectionItem] { get }
}