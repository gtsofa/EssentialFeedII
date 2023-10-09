//
//  CodableFeedStore.swift
//  EssentialFeedII
//
//  Created by Julius on 08/10/2023.
//

import Foundation

public class CodableFeedStore: FeedStore {
    private struct Cache: Codable {
        let feed: [CodableFeedImage]
        let timestamp: Date
        
        var localFeed: [LocalFeedItem] {
            return feed.map {$0.local}
        }
    }
    
    private struct CodableFeedImage: Codable {
        private let id: UUID
        private let description: String?
        private let location: String?
        private let url: URL
        
        init(_ item: LocalFeedItem) {
            id = item.id
            description = item.description
            location = item.location
            url = item.url
        }
        
        var local: LocalFeedItem {
            return LocalFeedItem(id: id, description: description, location: location, url: url)
        }
    }
    
    private let storeURL: URL
    
    private let queue = DispatchQueue(label: "\(CodableFeedStore.self)Queue", qos: .userInitiated)
    
    public init(storeURL: URL) {
        self.storeURL = storeURL
    }
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        let storeURL = self.storeURL
        queue.async {
            guard FileManager.default.fileExists(atPath: storeURL.path) else { return completion(nil)}
            
            do {
                try FileManager.default.removeItem(at: storeURL)
                completion(nil)
                
            } catch {
                completion(error)
            }
        }
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        let storeURL = self.storeURL
        queue.async {
            guard let data = try? Data(contentsOf: storeURL) else {
                return completion(.empty)
            }
            
            do {
                let decoder = JSONDecoder()
                let cache = try decoder.decode(Cache.self, from: data)
                completion(.found(feed: cache.localFeed, timestamp: cache.timestamp))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    public func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion) {
        let storeURL = self.storeURL
        queue.async {
            do {
                let encoder = JSONEncoder()
                let cache = Cache(feed: items.map(CodableFeedImage.init), timestamp: timestamp)
                let encoded = try! encoder.encode(cache)
                try encoded.write(to: storeURL)
                //completion insertion should be nil
                completion(nil)
                
            } catch {
                completion(error)
            }
        }
    }
}
