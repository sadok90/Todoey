//
//  Category.swift
//  Todoey
//
//  Created by Macbook pro rétina on 30/07/2018.
//  Copyright © 2018 Macbook pro rétina. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
