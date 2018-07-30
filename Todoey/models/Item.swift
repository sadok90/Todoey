//
//  Item.swift
//  Todoey
//
//  Created by Macbook pro rétina on 30/07/2018.
//  Copyright © 2018 Macbook pro rétina. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var date: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
