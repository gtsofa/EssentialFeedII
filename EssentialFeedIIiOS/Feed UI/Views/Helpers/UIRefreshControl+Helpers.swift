//
//  UIRefreshControl+Helpers.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 15/09/2023.
//

import UIKit
extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing(): endRefreshing()
    }
}
