//
//  HomeController.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

final class HomeController: ScreenController {

    // MARK: States0

    @Published var data: HomeScreenState<[HomeSection]> = .idle

    // MARK: Properties

    let repository: HomeRepositoryProtocol

    // MARK: Lifecycle

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: Logic

    func fetchFirstPage() {
        self.data = .fresh

        run { [weak self] in
            do {
                await self?.onStartLoading()
                let result = try await self?.repository.fetchSections()

                guard Task.isNotCancelled, let result else { return }

                await MainActor.run { [weak self] in
                    self?.data = result.isEmpty ? .empty : .ready(result)
                }
                
                await self?.onStopLoading()

            } catch {
                guard Task.isNotCancelled else { return }

                await self?.onLoadingFailure(error)
            }
        }
    }

    func fetchNextPage() {
        run { [weak self] in
            do {
                await self?.onStartLoadingMore()
                let result = try await self?.repository.fetchSections()

                guard Task.isNotCancelled, let result else { return }

                await MainActor.run { [weak self] in
                    if result.isEmpty == false, case let .ready(data) = self?.data {
                        self?.data = .ready(data + result)
                    }
                }

                await self?.onStopLoadingMore()

            } catch {
                guard Task.isNotCancelled else { return }

                await self?.onLoadingMoreFailure(error)
            }
        }
    }
}
