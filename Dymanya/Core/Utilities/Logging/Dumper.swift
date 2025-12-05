//
//  Dumper.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 14/07/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation

#if DEBUG
@inline(__always) public func debugDump<T>(_ value: T) {
    debugPrint(value)
}
#else
@inline(__always) public func debugDump<T>(_ value: T) {}
#endif

public func errorDump(_ value: Data) {
    dump(String(bytes: value, encoding: .utf8))
}
