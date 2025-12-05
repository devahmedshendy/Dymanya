//
//  APIClient.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// I made this protocol as I was going to provide Alamofire implementation since many wants it
protocol APIClient {
    func get<T: Encodable>(_ request: T) async throws -> T.Response where T: APIGetRequest, T.Response: APIResponse
    func post<T: Encodable>(_ request: T) async throws -> T.Response where T: APIPostRequest, T.Response: APIResponse
}

// MARK: Helpers

//extension APIClient where Self == AlamofireClient {
//    static func alamofire() -> APIClient {
//        DI.api()
//    }
//}
