//
//  MessageService.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation
import SQLite
import Alamofire
import SwiftyJSON

class MessageService {
    
    var db: Connection?
    
    init(_ db: Connection) {
        self.db = db
    }
    
    func getMessageInternet( chatId: Int64, version: Int64, clouser: @escaping ([Message])->())  {
        
        var messages: [Message] = []
        
        let parameters : Parameters = [ "id": chatId ]
        let headers : HTTPHeaders = [ "If-None-Match": String(version) ]
        
        Alamofire.request(DBManager.url + "chat/messages", parameters: parameters, headers: headers).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                for jsonObj in json.arrayValue {
                    
                    let id = jsonObj["id"].intValue
                    let text = jsonObj["text"].string
                    let version = jsonObj["version"].intValue
                    let userId = jsonObj["user"]["id"].intValue
                    
                    let message = Message(id: Int64(id), text: text!, version: Int64(version), userId: Int64(userId))
                    messages.append(message)
                }
                
            case .failure(let error):
                print(error)
            }
            clouser(messages)
        }
    }
    
    func postMessageInternet( chatId: Int64, text: String, clouser: @escaping (Message)->())  {
        
        
        let parameters : Parameters = ["chatId": chatId, "text": text, "userId": DBManager.rootUserId]
        
        Alamofire.request(DBManager.url + "message", method: .post, parameters: parameters).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                let id = json["id"].intValue
                let text = json["text"].string
                let version = json["version"].intValue
                let userId = json["user"]["id"].intValue
                let message = Message(id: Int64(id), text: text!, version: Int64(version), userId: Int64(userId))
                clouser(message)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
