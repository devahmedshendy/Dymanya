//
//  HomeRepository.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

protocol HomeRepositoryProtocol: AnyObject {
    func fetchSections() async throws -> Page<[HomeSection]>
}

final class HomeRepository: HomeRepositoryProtocol {

    // MARK: Properties

    private let api: APIClient

    // MARK: Lifecycle

    init(api: APIClient = .alamofire()) {
        self.api = api
    }

    // MARK: Logic

    func fetchSections() async throws -> Page<[HomeSection]> {
        let data = try await self.api.get(
            FetchHomeSectionsRequest()
        )

        return .init(
            data: data.sections
                .sorted { $0.order < $1.order }
                .map { $0.toDomain() },
            pagination: .init(
                nextPage: data.pagination.next_page,
                pageCount: data.pagination.total_pages
            )
        )
    }
}
