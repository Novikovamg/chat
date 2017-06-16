//
//  Chat.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation


class Chat {
    var id: Int64
    var lastMessage: String
    var version: Int64?
    
    init(id: Int64, lastMessage: String?, version: Int64) {
        self.id = id
        self.version = version
        if lastMessage == nil {
            self.lastMessage = "new chat"
        } else {
            self.lastMessage = lastMessage!
        }
    }
}
