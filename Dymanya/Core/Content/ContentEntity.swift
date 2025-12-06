//
//  ContentEntity.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

protocol ContentEntity: Identifiable, Sendable {
    var id: String { get }
    var title: String { get }
    var imageURL: URL { get }
}
