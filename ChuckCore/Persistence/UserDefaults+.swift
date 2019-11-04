//
//  UserDefaults+.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

public extension UserDefaults {

    static let chuckApplicationGroup = "group.codes.rafael.Chuck"

    static var groupDefaults: UserDefaults {
        return UserDefaults(suiteName: UserDefaults.chuckApplicationGroup) ?? .standard
    }

}
