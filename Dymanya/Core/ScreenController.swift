//
//  ScreenController.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import SwiftUI
import Combine

class ScreenController: ObservableObject {

    // MARK: States

    @Published
    private(set) var isLoading: Bool = false

    @Published
    private(set) var isLoadingMore: Bool = false

    @Published
    private(set) var isRefreshing: Bool = false

    @Published
    private(set) var toast: String?

    // MARK: Properties

    var bags: [String: AnyCancellable] = [:]
    var tasks: [String: Task<Void, Never>] = [:]

    // MARK: Lifecycle

    deinit {
        Task { @MainActor [bags, tasks] in
            bags.values.forEach { $0.cancel() }
            tasks.values.forEach { $0.cancel() }
        }

        deinitLog(Self.self)
    }

    // MARK: Logic

    func run(
        _ callerName: String = #function,
        operation: @escaping @isolated(any) () async -> Void
    ) {
        tasks[callerName]?.cancel()
        tasks[callerName] = Task { [weak self] in
            // 'defer' guarantees this code runs at the end,
            // no matter if the task succeeds, fails, or is cancelled.
            defer {
                // This is the fix: Remove the task from the dictionary
                // once its work is done.
                self?.tasks[callerName] = nil
            }

            // We still need to check if the UseCase is alive before running.
            guard self != nil else { return }

            // Run the original operation.
            await operation()
        }
    }

    // MARK: State Mutators

    func onToastMessage(_ error: Error) {
        self.toast = error.mapToApplicationError().message
    }

    // isLoading

    func onStartLoading() async {
        await MainActor.run { [weak self] in
            self?.onStartLoading()
        }
    }

    func onStartLoading() {
        self.isLoading = true
    }

    func onStopLoading() async {
        await MainActor.run { [weak self] in
            self?.onStopLoading()
        }
    }

    func onStopLoading() {
        self.isLoading = false
    }

    func onLoadingFailure(_ error: Error) async {
        await MainActor.run { [weak self] in
            self?.onLoadingFailure(error)
        }
    }

    func onLoadingFailure(_ error: Error) {
        self.isLoading = false
        self.toast = error.mapToApplicationError().message
    }

    func onSilentLoadingFailure(_ error: Error) {
        self.onStopLoading()
    }

    // isLoadingMore

    func onStartLoadingMore() async {
        await MainActor.run { [weak self] in
            self?.onStartLoadingMore()
        }
    }

    func onStartLoadingMore() {
        self.isLoadingMore = true
    }

    func onStopLoadingMore() async {
        await MainActor.run { [weak self] in
            self?.onStopLoadingMore()
        }
    }

    func onStopLoadingMore() {
        self.isLoadingMore = false
    }

    func onLoadingMoreFailure(_ error: Error) async {
        await MainActor.run { [weak self] in
            self?.onLoadingMoreFailure(error)
        }
    }

    func onLoadingMoreFailure(_ error: Error) {
        self.isLoadingMore = false
        self.toast = error.mapToApplicationError().message
    }

    // isLoadingMore

    func onStartRefreshing() {
        self.isRefreshing = true
    }

    func onStopRefreshing() {
        self.isRefreshing = false
    }

    func onRefreshingFailure(_ error: Error) {
        self.isRefreshing = false
        self.toast = error.mapToApplicationError().message
    }
}
