//
//  ChuckCoreViewModelTests.swift
//  ChuckCoreTests
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import XCTest
@testable import ChuckCore

class ChuckCoreViewModelTests: XCTestCase {

    func testViewModelWithLargeMetrics() throws {
        let joke = try Joke.sample()
        let viewModel = JokeViewModel(joke: joke)

        XCTAssertEqual(viewModel.preferredMetrics, .large)
        XCTAssertEqual(viewModel.categoryName, "POLITICAL")
        XCTAssertEqual(viewModel.id, "uanj8roxsrwq6pgb0kufia")
        XCTAssertEqual(viewModel.body, "Guantuanamo Bay, Cuba, is the military code-word for \"Chuck Norris\' basement\".")
    }

    func testViewModelWithNoCategory() throws {
        let response = try SearchResponse.sample()
        let joke = response.result.first!

        let viewModel = JokeViewModel(joke: joke)
        XCTAssertEqual(viewModel.preferredMetrics, .regular)
        XCTAssertEqual(viewModel.categoryName, "UNCATEGORIZED")
    }

}
