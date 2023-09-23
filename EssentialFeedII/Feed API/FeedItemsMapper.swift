//
//  FeedItemsMapper.swift
//  EssentialFeedII
//
//  Created by Julius on 02/03/2023.
//

import Foundation

internal final class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        
        var feed: [FeedImage] {
            return items.map { $0.item}
        }
    }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedImage {
            return FeedImage(id: id, description: description, location: location, url: image)
        }
    }
    
    static func map( _ data: Data, _ response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.isOK,
              let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }

        return .success(root.feed)
    }
}
