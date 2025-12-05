//
//  String+HttpMethod.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// swiftlint:disable type_name
extension String {
    enum httpHeader { }
}

extension String.httpHeader {
    static var Accept: String { "Accept" }
    static var Authorization: String { "Authorization" }
}
// swiftlint:enable type_name
