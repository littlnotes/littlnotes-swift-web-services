import XCTest
@testable import LittlWebServices

final class LittlWebServicesTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(LittlWebServices().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
