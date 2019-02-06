//
//  Category.swift
//  Todoey
//
//  Created by Nadya Postriganova on 4/2/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()

}
