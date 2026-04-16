//
//  MyRecipe.swift
//  FeedTheFridge3
//
//  Created by Micha Glissmann on 14/04/2026.
//

import Foundation
import CoreData

@objc(MyRecipe)
class MyRecipe: NSManagedObject {
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var ingredients: String!
    @NSManaged var directions: String!
    @NSManaged var ner: String!
    @NSManaged var dateDeleted: Date?
    
}
