//
//  LoginModuleprefixLoginModuleRouter.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class LoginModuleRouter: LoginModuleRouterInput {
    var chatModulePresenter: ChatModuleInput?
    
    func sendChatsToChatModule( chats: [Chat]) {
        chatModulePresenter?.setChats(chats)
    }

}
