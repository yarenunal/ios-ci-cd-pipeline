import XCTest

final class TestingTests: XCTestCase {
    func testToplama() {
        XCTAssertEqual(2 + 3, 6)
    }

    func testMetinBosDegil() {
        let metin = "Hello, world!"
        XCTAssertFalse(metin.isEmpty)
    }
}
