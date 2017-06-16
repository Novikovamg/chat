//
//  prefixLoginModuleprefixLoginModuleInteractor.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class LoginModuleInteractor: LoginModuleInteractorInput {

    weak var output: LoginModuleInteractorOutput!
    
    func logInAccount(login: String, password: String, clouser: @escaping (Int64)->()) {
        DBManager.userService.getUserIdInternet(login: login, password: password) { userId in
            DBManager.rootUserId = userId
            clouser(userId)
        }
    }
    
    func getChats(id:Int64, clouser: @escaping ([Chat])->()) {
        DBManager.chatService.getChatInternet(id: id) { chats in
            clouser(chats)
        }
    }
    
}
