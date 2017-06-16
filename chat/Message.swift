//
//  Message.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation

class Message {
    var id: Int64
    var text: String
    var version: Int64
    var userId: Int64
    
    init(id: Int64, text: String, version: Int64, userId: Int64) {
        self.id = id
        self.text = text
        self.version = version
        self.userId = userId
    }
}
