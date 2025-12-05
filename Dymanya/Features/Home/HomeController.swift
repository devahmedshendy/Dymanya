//
//  HomeController.swift
//  Dymanya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI

import Swift

final class HomeController: ScreenController {

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
                try await self?.repository.fetchSections()
                await self?.onStopLoading()

            } catch {
                guard Task.isNotCancelled else { return }

                await self?.onLoadingFailure(error)
            }
        }
    }
}
