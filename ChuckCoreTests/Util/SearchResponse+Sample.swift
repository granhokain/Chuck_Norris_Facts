//
//  SearchResponse+Sample.swift
//  ChuckCoreTests
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import XCTest
@testable import ChuckCore

extension SearchResponse {

    static func sample() throws -> SearchResponse {
        let data = try Bundle.chuckCore.fetch(resource: .search)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(SearchResponse.self, from: data)

        return response
    }

}
