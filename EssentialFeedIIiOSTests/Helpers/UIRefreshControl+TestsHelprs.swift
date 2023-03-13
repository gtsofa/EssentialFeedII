//
//  UIRefreshControl+TestsHelprs.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 13/03/2023.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
