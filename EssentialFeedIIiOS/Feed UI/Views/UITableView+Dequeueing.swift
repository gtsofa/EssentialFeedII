//
//  UITableView+Dequeueing.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 03/09/2023.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
