//
//  APIClientHandlerProxy.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 14/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import Foundation

struct APIClientHandlerProxy: APIClient {

    private typealias Err = APIError

    // MARK: Properties

    private let api: APIClient

    // MARK: Lifecycle

    init(api: APIClient) {
        self.api = api
    }

    // MARK: Logic

    func get<T: APIGetRequest>(_ request: T) async throws -> T.Response where T.Response: APIResponse {
        try await api.get(request)
    }

    func post<T: APIPostRequest>(_ request: T) async throws -> T.Response where T.Response: APIResponse {
        try await api.post(request)
    }
}
