//
//  UIButton+TestHelpers.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 22/08/2023.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
