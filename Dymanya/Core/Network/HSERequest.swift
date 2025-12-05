//
//  HSERequest.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol HSERequest: APIRequest { }

// MARK: Defaults

extension HSERequest {
    var headers: [String: String] { authHeaders }
}

extension HSERequest {
    var authHeaders: [String: String] {
        ["accept": "application/json"]
    }
}

// MARK: Components

// GET
protocol APIGetRequest: HSERequest {
//    var params: [String : String] { get }
}

extension APIGetRequest {
    var method: String { .httpMethod.GET }
    var data: Encodable { self }
}

// POST
protocol APIPostRequest: HSERequest {

}

extension APIPostRequest {
    var method: String { .httpMethod.POST }
    var data: Encodable { self }
}
