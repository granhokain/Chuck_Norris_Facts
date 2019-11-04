//
//  CategoryViewModel.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation
import RxDataSources

public struct CategoryViewModel: Equatable, IdentifiableType {

    public typealias Identity = String

    public var identity: String {
        return category.name
    }

    public let category: Category

    public init(category: Category) {
        self.category = category
    }

    public var name: String {
        return category.name.uppercased()
    }

}
