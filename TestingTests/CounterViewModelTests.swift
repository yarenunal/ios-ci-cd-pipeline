import XCTest
@testable import Testing

@MainActor
final class CounterViewModelTests: XCTestCase {
    func testIncrementAddsOne() {
        let viewModel = CounterViewModel()
        viewModel.increment()
        XCTAssertEqual(viewModel.count, 1)
    }

    func testDecrementDoesNotGoBelowZero() {
        let viewModel = CounterViewModel()
        viewModel.decrement()
        XCTAssertEqual(viewModel.count, 0)
    }

    func testResetSetsCountToZero() {
        let viewModel = CounterViewModel()
        viewModel.increment()
        viewModel.increment()
        viewModel.reset()
        XCTAssertEqual(viewModel.count, 0)
    }
}
