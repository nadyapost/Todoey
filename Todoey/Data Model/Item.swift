//
//  Item.swift
//  Todoey
//
//  Created by Nadya Postriganova on 4/2/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var done = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
