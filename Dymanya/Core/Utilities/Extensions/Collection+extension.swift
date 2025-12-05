//
//  Collection+extension.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 18/07/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation

public extension MutableCollection {
    subscript(safe index: Index) -> Element? {
        get {
            indices.contains(index) ? self[index] : nil
        }

        mutating set {
            if indices.contains(index), let value = newValue {
                self[index] = value
            }
        }
    }
}

// extension MutableCollection where Element: Equatable {
//    /// Returns the element at the specified index iff it is within count, otherwise nil.
//    subscript(safe index: Index) -> Element? {
//        get {
//            indices.contains(index) ? self[index] : nil
//        }
//        mutating set {
//            if indices.contains(index), let value = newValue {
//                self[index] = value
//            }
//        }
//    }
// }
