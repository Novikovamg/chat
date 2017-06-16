//
//  User.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation

class User {
    
    var id: Int64?
    var name: String?
    
    init(id: Int64, name: String) {
        self.id = id
        self.name = name
    }
}
