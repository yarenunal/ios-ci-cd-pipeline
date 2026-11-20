import Foundation

nonisolated final class CounterViewModel {
    private(set) var count = 0

    func increment() {
        count += 1
    }

    func decrement() {
        guard count > 0 else { return }
        count -= 1
    }

    func reset() {
        count = 0
    }
}
