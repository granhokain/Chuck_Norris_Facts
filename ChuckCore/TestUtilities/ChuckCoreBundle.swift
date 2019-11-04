//
//  ChuckCoreBundle.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

private final class _StubForBundleInitialization { }

extension Bundle {

    public static let chuckCore: Bundle = {
        return Bundle(for: _StubForBundleInitialization.self)
    }()

}
