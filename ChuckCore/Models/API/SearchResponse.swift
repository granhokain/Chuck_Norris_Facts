//
//  SearchResponse.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

public struct SearchResponse: Codable {
    public let total: Int
    public let result: [Joke]
}
