//
//  UITestingLabel.swift
//  ChuckCore
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import UIKit

public enum UITestingLabel: String {
    case jokeCell
    case jokesList
    case loadingIndicator
    case searchButton
    case emptyView
    case searchView
    case searchBar
    case categoryBadge
    case recentSearchBadge
}

extension UIResponder {

    public var uiTestingLabel: UITestingLabel? {
        get {
            guard let label = accessibilityLabel else { return nil }

            return UITestingLabel(rawValue: label)
        }
        set {
            accessibilityLabel = newValue?.rawValue
        }
    }

}
