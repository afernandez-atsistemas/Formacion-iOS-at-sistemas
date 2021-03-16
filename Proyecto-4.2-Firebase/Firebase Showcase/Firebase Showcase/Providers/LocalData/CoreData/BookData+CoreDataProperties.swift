//
//  BookData+CoreDataProperties.swift
//  Firebase Showcase
//
//  Created by Abrahán Fernández on 15/3/21.
//
//

import Foundation
import CoreData


extension BookData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookData> {
        return NSFetchRequest<BookData>(entityName: "BookData")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var hasEditor: EditorialData?

}

extension BookData : Identifiable {

}
