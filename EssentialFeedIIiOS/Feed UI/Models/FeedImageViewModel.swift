//
//  FeedImageViewModel.swift
//  EssentialFeedIIiOS
//
//  Created by Julius on 28/08/2023.
//
import Foundation
import EssentialFeedII

final class FeedImageViewModel<Image> {
    typealias Observer<T> = (T) -> Void
    private var task: FeedImageDataLoaderTask?
    private var model: FeedImage
    private var imageLoader: FeedImageDataLoader?
    private let imageTransformer: (Data) -> Image?
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader, imageTransformer: @escaping (Data) -> Image?) {
        self.imageLoader = imageLoader
        self.model = model
        self.imageTransformer = imageTransformer
    }
    
    var description: String? {
        return model.description
    }
    
    var location: String? {
        return model.location
    }
    
    var hasLocation: Bool {
        return location != nil
    }
    
    var onImageLoad: Observer<Image>?
    var onShouldRetryImageLoadStateChange: Observer<Bool>?
    var onImageLoadingStateChange: Observer<Bool>?
    
    func loadImageData() {
        onImageLoadingStateChange?(true)
        onShouldRetryImageLoadStateChange?(false)
        task = imageLoader?.loadImageData(from: model.url) { [weak self ] result in
            self?.handle(result)
        }
        
    }
    
    func handle(_ result: FeedImageDataLoader.Result) {
        if let image = (try? result.get()).flatMap(imageTransformer) {
            onImageLoad?(image)
        } else {
            onShouldRetryImageLoadStateChange?(true)
        }
        onImageLoadingStateChange?(false)
    }
    
    func cancelImageDataLoad() {
        task?.cancel()
        task = nil
    }
}
