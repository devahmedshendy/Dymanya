//
//  APIRequest.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol APIRequest: Encodable {
    associatedtype Response: Decodable

    var api: URL { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String] { get }
    var data: Encodable { get }
}

// MARK: Defaults

extension APIRequest {
    var headers: [String: String] { [:] }
    var url: URL { URL(string: path, relativeTo: api)! }
}
