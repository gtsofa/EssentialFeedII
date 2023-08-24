//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 22/08/2023.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
