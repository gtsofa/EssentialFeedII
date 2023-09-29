//
//  RemoteFeedItem.swift
//  EssentialFeedII
//
//  Created by Julius on 29/09/2023.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
