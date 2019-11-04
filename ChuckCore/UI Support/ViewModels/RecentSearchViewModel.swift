//
//  RecentSearchViewModel.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import RxDataSources

public struct RecentSearchViewModel: Equatable, IdentifiableType {

    public typealias Identity = String

    public var identity: String {
        return recentSearch.term
    }

    public let recentSearch: RecentSearch

    public init(with recentSearch: RecentSearch) {
        self.recentSearch = recentSearch
    }

    public var term: String {
        return recentSearch.term.uppercased()
    }

}
