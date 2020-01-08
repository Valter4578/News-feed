//
//  Article+CoreDataProperties.swift
//  News feeed
//
//  Created by Максим Алексеев on 08.01.2020.
//  Copyright © 2020 Максим Алексеев. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var source: String?
    @NSManaged public var articleDescription: String?
    @NSManaged public var author: String?
    @NSManaged public var content: String?

}
