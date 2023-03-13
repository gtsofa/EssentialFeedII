//
//  UIRefreshControl+TestsHelprs.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 13/03/2023.
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
