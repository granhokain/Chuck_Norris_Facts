//
//  ChuckAPIEnvironment+Test.swift
//  ChuckCoreTests
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

extension ChuckAPIEnvironment {

    /// The testing environment uses assets in the bundle's resources path to mimick API responses
    public static let test: ChuckAPIEnvironment = {
        let resolver: ChuckAPIEnvironment.EndpointResolver = { environment, path, query in
            var mockFilename: String?

            switch path {
            case let path where path.contains("search"):
                mockFilename = query.contains(where: { $0.value == "empty" }) ? "searchEmpty" : "search"
            case let path where path.contains("categories"):
                mockFilename = "categories"
            case let path where path.contains("random"):
                mockFilename = query.contains(where: { $0.name == "category" }) ? "randomWithCategory" : "random"
            default:
                break
            }

            guard let filename = mockFilename else {
                fatalError("Invalid path for test environment: \(path)")
            }

            guard let url = environment.baseComponents.url?.appendingPathComponent(filename).appendingPathExtension("json") else {
                fatalError("Failed to generate URL for testing environment")
            }

            return URLRequest(url: url)
        }

        guard let baseURL = Bundle.chuckCore.resourceURL else {
            fatalError("Failed to get resource URL for ChuckCoreTests bundle which is required for the test to run")
        }

        return ChuckAPIEnvironment(baseComponents: URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!, resolver: resolver)
    }()

}
