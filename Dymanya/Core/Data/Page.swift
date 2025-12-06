//
//  Page.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

struct Page<Data> {
    let id = UUID()
    let data: Data
    let pagination: Pagination
}

struct Pagination {
    let nextPage: String
    let pageCount: Int
}
