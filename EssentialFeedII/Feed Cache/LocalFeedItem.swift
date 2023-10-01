//
//  LocalFeedItem.swift
//  EssentialFeedII
//
//  Created by Julius on 29/09/2023.
//

import Foundation

public struct LocalFeedItem: Hashable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}