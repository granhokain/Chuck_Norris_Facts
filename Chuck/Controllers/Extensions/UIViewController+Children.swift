//
//  UIViewController+Children.swift
//  Chuck
//
//  Created by Rafael Martins on 30/10/19.
//  Copyright © 2019 Rafael Martins. All rights reserved.
//

import UIKit

extension UIViewController {

    func installChild(_ viewController: UIViewController,
                      withMask autoresizingMask: UIViewAutoresizing = [.flexibleWidth, .flexibleHeight])
    {
        addChildViewController(viewController)
        viewController.view.autoresizingMask = autoresizingMask
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
    }

}
