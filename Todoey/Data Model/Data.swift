//
//  Data.swift
//  Todoey
//
//  Created by Nadya Postriganova on 4/2/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
