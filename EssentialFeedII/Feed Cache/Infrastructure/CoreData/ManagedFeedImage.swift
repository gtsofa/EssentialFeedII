//
//  ManagedFeedImage.swift
//  EssentialFeedII
//
//  Created by Julius on 12/10/2023.
//

import CoreData

@objc(ManagedFeedImage)
class ManagedFeedImage: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var imageDescription: String?
    @NSManaged var location: String?
    @NSManaged var url: URL
    @NSManaged var data: Data?
    @NSManaged var cache: ManagedCache
    
    var local: LocalFeedItem {
        return LocalFeedItem(id: id, description: imageDescription, location: location, url: url)
    }
}

extension ManagedFeedImage {
    static func images(from localFeed: [LocalFeedItem], in context: NSManagedObjectContext) -> NSOrderedSet {
        return NSOrderedSet(array: localFeed.map { local in
            let managed = ManagedFeedImage(context: context)
            managed.id = local.id
            managed.imageDescription = local.description
            managed.location = local.location
            managed.url = local.url
            
            return managed
        })
    }
}
