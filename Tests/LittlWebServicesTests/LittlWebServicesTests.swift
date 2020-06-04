import XCTest
@testable import LittlWebServices

final class LittlWebServicesTests: XCTestCase {
//    func testUserCreateAccount() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        let expectation = XCTestExpectation(description: "Waiting for request")
//        UserRouter.createAccount(name: "Test2", email: "test2@example.com", password: "pass1234") {
//            XCTAssert(Token.current != nil)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: Route.timeout)
//    }
    
    func testUserLogin() {
        let expectation = XCTestExpectation(description: "Waiting for request.")
        UserRouter.login(email: "test2@example.com", password: "pass1234") {
            XCTAssert(Token.current != nil)
            print(Token.current!.key)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: Route.timeout)
    }
    
    func testUserLogout() {
        
        var expectation = XCTestExpectation(description: "Waiting for request.")
        UserRouter.login(email: "test2@example.com", password: "pass1234") {
            XCTAssert(Token.current != nil)
            print(Token.current!.key)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: Route.timeout)
        
        expectation = XCTestExpectation(description: "Waiting for request.")
        UserRouter.logout() {
            XCTAssert(Token.current == nil)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: Route.timeout)
    }
    
    func testUserLogoutAll() {
        
        var expectation = XCTestExpectation(description: "Waiting for request.")
        UserRouter.login(email: "test2@example.com", password: "pass1234") {
            XCTAssert(Token.current != nil)
            print(Token.current!.key)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: Route.timeout)
        
        expectation = XCTestExpectation(description: "Waiting for request.")
        UserRouter.logoutAllDevices() {
            XCTAssert(Token.current == nil)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: Route.timeout)
    }

    static var allTests = [
        ("testUserLogin", testUserLogin),
        ("testUserLogout", testUserLogout),
        ("testUserLogoutAll", testUserLogoutAll),
    ]
}
