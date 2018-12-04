//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Andrey Sergeev on 12/3/18.
//  Copyright © 2018 Andrey Sergeev. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var photoID: String?
    @NSManaged public var title: String?
    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var remoteURL: NSURL?

}
