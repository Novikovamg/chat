//
//  ChatService.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation
import SQLite
import Alamofire
import SwiftyJSON

class ChatService {
    
    var db: Connection!
    
    let chat = Table("chat")
    
    let id = Expression<Int64>("id")
    let lastMessage = Expression<String>("lastMessage")
    let version = Expression<Int64>("version")
    
    init(_ db: Connection) {
        self.db = db
    }
    
    func createTable() {
        do {
            try db.run(chat.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(lastMessage)
                table.column(version)
            })
        } catch {
            print("Chat table didn't created!")
        }
    }
    
    func addChatDB(id: Int64, lastMessage: String, version: Int64) {
        do {
            let insert = chat.insert(self.id <- id,
                                     self.lastMessage <- lastMessage,
                                     self.version <- version
                                    )
            let _ = try db.run(insert)
        } catch {
            print("Chat didn't added to table.")
        }
    }
    
    func deleteAllDB(){
        do {
            try db.run(chat.delete())
        } catch  {
            print("Chat table didn't droped")
        }
    }
    
    func updateChatDB(id: Int64, lastMessage: String, version: Int64) {
        let modifiable = chat.filter(self.id == id)
        do {
            try db.run(modifiable.update(self.lastMessage <- lastMessage, self.version <- version))
        } catch {
            print("Chat row didn't updated")
        }
    }
    
    func getChatInternet(id: Int64, clouser: @escaping ([Chat])->()) {
        var chats: [Chat] = []
        
        let parameters : Parameters = [ "id": id]
        
        Alamofire.request(DBManager.url + "user/chats", parameters: parameters).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                
                for jsonObj in json.arrayValue {
                        
                    let id = jsonObj["id"].intValue
                    let lastMessage = jsonObj["lastMessage"].string
                    let version = jsonObj["version"].intValue
                        
                    let chat = Chat(id: Int64(id), lastMessage: lastMessage, version: Int64(version))
                    chats.append(chat)
                }
                clouser(chats)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getChatBySearchString(searchString: String, clouser: @escaping ([Chat])->()) {
        var chats: [Chat] = []
        
        let parameters : Parameters = [ "searchString": searchString]
        
        Alamofire.request(DBManager.url + "user/search", parameters: parameters).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                for jsonObj in json.arrayValue {
                    
                    let id = jsonObj["id"].intValue
                    let name = jsonObj["name"].stringValue
                    
                    let chat = Chat(id: Int64(id), lastMessage: name, version: 0)
                    
                    chats.append(chat)
                }
                
                clouser(chats)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func postChat(userId: Int64, interlocutorId: Int64, clouser: @escaping (Chat)->()) {
        
        let parameters : Parameters = [ "id": userId, "interlocutorId": interlocutorId]
        
        Alamofire.request(DBManager.url + "user/chats", method: .post, parameters: parameters).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                    
                let id = json["id"].intValue
                let name = json["name"].stringValue
                    
                let chat = Chat(id: Int64(id), lastMessage: name, version: 0)
                
                clouser(chat)
            case .failure(let error):
                print(error)
            }
        }

    }
}





















































