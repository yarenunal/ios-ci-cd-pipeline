import XCTest

final class TestingTests: XCTestCase {
    func testToplama() {
        XCTAssertEqual(2 + 3, 5)
    }

    func testMetinBosDegil() {
        let metin = "Hello, world!"
        XCTAssertFalse(metin.isEmpty)
    }
}
