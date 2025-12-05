//
//  Injected.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 14/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import FactoryKit
import Foundation
import SwiftUI

// @propertyWrapper
// public struct Injected<T> {
//    private let keyPath: KeyPath<Container, Factory<T>>
//
//    public var wrappedValue: T {
//        // Change: Access the .shared instance and call the factory with ()
//        return Container.shared[keyPath: keyPath]()
//    }
//
//    public init(_ keyPath: KeyPath<Container, Factory<T>>) {
//        self.keyPath = keyPath
//    }
// }
//
//// You can do the same for ObservableObjects
// @propertyWrapper
// @MainActor public struct InjectedObject<T: ObservableObject> {
//    @StateObject private var dependency: T
//
//    public var wrappedValue: T {
//        dependency
//    }
//
//    /// Manages the wrapped dependency.
//    public var projectedValue: ObservedObject<T>.Wrapper {
//        return $dependency
//    }
//
//    public init<C: SharedContainer>(_ keyPath: KeyPath<C, Factory<T>>) {
//        self._dependency = StateObject<T>(
//            wrappedValue: C.shared[keyPath: keyPath]()
//        )
//    }
//
//    public init(_ keyPath: KeyPath<Container, Factory<T>>) {
//        // Change: Access the .shared instance and call the factory with ()
//        // to get the object that @StateObject will manage.
//        self._dependency = StateObject<T>(
//            wrappedValue: Container.shared[keyPath: keyPath]()
//        )
//    }
// }
