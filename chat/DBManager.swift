//
//  DBManager.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation
import SQLite

class DBManager {
    
    static let db = try! Connection()
    
    static let userService = UserService(db)
    static let chatService = ChatService(db)
    static let messageService = MessageService(db)
    
    static var rootUserId: Int64 = -1
    
    static let url = "http://34.211.101.34:8080/"
    
    init() {
        
        if DBManager.db.userVersion == 0 {
            
            do {
                try DBManager.db.run(DBManager.userService.user.drop(ifExists: true))
                try DBManager.db.run(DBManager.chatService.chat.drop(ifExists: true))
                DBManager.userService.createTable()
                DBManager.chatService.createTable()
            } catch {
                print("New DB didn't created")
            }
            DBManager.db.userVersion = 1
        }
    }
    
}


// Расширение для версий
extension Connection {
    public var userVersion: Int32 {
        get { return Int32(try! scalar("PRAGMA user_version") as! Int64)}
        set { try! run("PRAGMA user_version = \(newValue)") }
    }
}
