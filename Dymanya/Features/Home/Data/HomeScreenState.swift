//
//  HomeScreenState.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 06/12/2025.
//

import Foundation

enum HomeScreenState<T> {
    case idle
    case fresh
    case ready(_ data: T)
    case empty
}
