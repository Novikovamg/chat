//
//  AddChatModuleAddChatModuleRouter.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class AddChatModuleRouter: AddChatModuleRouterInput {
    
    var chatModulePresenter: ChatModuleInput?
    
    func sendChatToChatModule(chat: Chat) {
        chatModulePresenter?.setChat(chat)
    }

}
