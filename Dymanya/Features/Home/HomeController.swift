//
//  HomeController.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

final class HomeController: ScreenController {

    // MARK: States0

    @Published var data: [HomeSection] = []
    private var pagination: Pagination = .init(
        nextPage: "",
        pageCount: 0
    )

    // MARK: Properties

    let repository: HomeRepositoryProtocol

    // MARK: Lifecycle

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: Logic

    func screenDidAppear() {
        run { [weak self] in
            do {
                await self?.onStartLoading()
                let result = try await self?.repository.fetchSections()

                guard Task.isNotCancelled, let result else { return }

                await MainActor.run { [weak self] in
                    self?.data = result.data
                    self?.pagination = result.pagination
                }
                
                await self?.onStopLoading()

            } catch {
                guard Task.isNotCancelled else { return }

                await self?.onLoadingFailure(error)
            }
        }
    }
}
