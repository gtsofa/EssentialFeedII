//
//  UIButton+TestHelpers.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 22/08/2023.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
