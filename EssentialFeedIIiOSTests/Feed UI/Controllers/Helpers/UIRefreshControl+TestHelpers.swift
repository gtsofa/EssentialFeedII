//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 22/08/2023.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
