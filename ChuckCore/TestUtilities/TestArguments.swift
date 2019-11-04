//
//  TestArguments.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import Foundation

public final class TestArguments {

    public static var isRunningUITests: Bool {
        return ProcessInfo.processInfo.arguments.contains("--uitests")
    }

}
