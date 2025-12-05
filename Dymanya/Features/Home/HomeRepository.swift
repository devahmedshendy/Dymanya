//
//  HomeRepository.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

protocol HomeRepositoryProtocol: AnyObject {
    func fetchSections() async throws
}

final class HomeRepository: HomeRepositoryProtocol {

    // MARK: Properties

    private let api: APIClient

    // MARK: Lifecycle

    init(api: APIClient = .alamofire()) {
        self.api = api
    }

    // MARK: Logic

    func fetchSections() async throws {
        let data = try await self.api.get(
            FetchHomeSectionsRequest()
        )

        debugLog(data)

        if data.sections.isEmpty { return }

        try await fetchSections()
    }
}
