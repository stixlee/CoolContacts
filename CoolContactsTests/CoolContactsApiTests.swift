//
//  CoolContactsTests.swift
//  CoolContactsTests
//
//  Created by Michael Lee on 1/31/24.
//

import XCTest
@testable import CoolContacts

final class CoolContactsApiTests: XCTestCase {

    func fetchTest() throws {
        let expectation = self.expectation(description: "Fetch Employees")
        Task {
            do {
                let _ = try await api.fetchEmployees()
                expectation.fulfill()
            } catch (let error) {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
