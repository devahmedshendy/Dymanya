//
//  HomeRepository.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

protocol HomeRepositoryProtocol: AnyObject {
    func fetchSections() async throws -> [HomeSection]
}

extension HomeRepositoryProtocol where Self == HomeRepository {
    func `default`() -> Self {
        .init()
    }
}

final class HomeRepository: HomeRepositoryProtocol {

    // MARK: Properties

    private let api: APIClient

    // MARK: Lifecycle

    init(api: APIClient = .alamofire()) {
        self.api = api
    }

    // MARK: Logic

    func fetchSections() async throws -> [HomeSection] {
        let data = try await self.api.get(
            FetchHomeSectionsRequest()
        )

        return data.sections
            .sorted { $0.order < $1.order }
            .map { $0.toDomain() }
    }
}
