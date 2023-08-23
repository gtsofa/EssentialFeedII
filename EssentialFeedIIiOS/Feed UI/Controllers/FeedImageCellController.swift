//
//  FeedImageCellController.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 23/08/2023.
//

import UIKit
import EssentialFeedII

final class FeedImageCellController {
    private var task: FeedImageDataLoaderTask?
    private var model: FeedImage
    private var imageLoader: FeedImageDataLoader?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.imageLoader = imageLoader
        self.model = model
    }
    
    func view() -> UITableViewCell {
        //let cellModel = tableModel[indexPath.row]
        let cell = FeedImageCell()
        cell.locationContainer.isHidden = (model.location == nil)
        cell.locationLabel.text = model.location
        cell.descriptionLabel.text = model.description
        cell.feedImageView.image = nil // set it to nil to avoid issues when reusing cells
        cell.feedImageRetryButton.isHidden = true
        cell.feedImageContainer.startShimmering()
        
        // inner closure
        let loadImage = { [weak self, weak cell] in
            guard let self = self else { return }
            
            self.task = self.imageLoader?.loadImageData(from: model.url) { [weak cell ] result in
                let data = try? result.get()
                let image = data.map(UIImage.init) ?? nil
                cell?.feedImageView.image = image
                cell?.feedImageRetryButton.isHidden = (image != nil)//button is visible if it couldn't get the converted data to image from the result
                cell?.feedImageContainer.stopShimmering()
            }
        }
        
        cell.onRetry = loadImage // set the cell onRetry callback
        loadImage() // invoke innner closure here
        return cell
    }
    
    func preload() {
        task = imageLoader?.loadImageData(from: model.url) { _ in }
    }
    
    deinit {
        task?.cancel()
    }
}
