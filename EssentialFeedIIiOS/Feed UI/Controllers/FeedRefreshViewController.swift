//
//  FeedRefreshViewController.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 23/08/2023.
//

import UIKit
import EssentialFeedII

final class FeedRefreshViewController: NSObject {
    private(set) lazy var view: UIRefreshControl = {
        let view = UIRefreshControl()
        binded(view)
        return view
    }()
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
    
    @objc  func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) {
        //binds the viewmodel with the view i.e onchange closure
        viewModel.onChange =  { [weak self ] viewModel in
            if viewModel.isLoading {
                self?.view.beginRefreshing()
            } else {
                self?.view.endRefreshing()
            }
        }
        //binds view with the viewmodel
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
}
