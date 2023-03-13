//
//  UIButton+TestHelpers.swift
//  EssentialFeedIIiOSTests
//
//  Created by Julius on 13/03/2023.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
