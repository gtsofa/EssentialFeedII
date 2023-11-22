//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Julius on 22/11/2023.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.main.run(until: Date())
    }
}
