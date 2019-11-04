//
//  ChuckAPIEnvironment.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import os.log

public struct ChuckAPIEnvironment {
    typealias EndpointResolver = (ChuckAPIEnvironment, String, [URLQueryItem]) -> URLRequest?

    let baseComponents: URLComponents
    let resolver: EndpointResolver

    public static let production = ChuckAPIEnvironment(
        baseComponents: URLComponents(string: "https://api.chucknorris.io")!,
        resolver: ChuckAPIEnvironment.standardResolver
    )

    func resolve(path: String, query: [URLQueryItem]) -> URLRequest? {
        return resolver(self, path, query)
    }

    static func standardResolver(environment: ChuckAPIEnvironment, path: String, query: [URLQueryItem]) -> URLRequest? {
        var components = environment.baseComponents

        components.path = path
        components.queryItems = query

        guard let url = components.url else {
            os_log(
                "Failed to generate URL for endpoint %@",
                log: .default,
                type: .error,
                String(describing: self)
            )
            return nil
        }

        return URLRequest(url: url)
    }
}
