//
//  RecentSearch.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

public struct RecentSearch: Equatable {

    public let createdAt: Date
    public let term: String

    public init(term: String, createdAt: Date = Date()) {
        self.createdAt = createdAt
        self.term = term
    }

}
