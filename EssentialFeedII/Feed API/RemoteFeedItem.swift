//
//  RemoteFeedItem.swift
//  EssentialFeedII
//
//  Created by Julius on 29/09/2023.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
