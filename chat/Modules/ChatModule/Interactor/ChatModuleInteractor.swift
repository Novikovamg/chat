//
//  ChatModuleChatModuleInteractor.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class ChatModuleInteractor: ChatModuleInteractorInput {

    weak var output: ChatModuleInteractorOutput!
    
    func getChats(clouser: @escaping ([Chat])->()) {
        DBManager.chatService.getChatInternet(id: DBManager.rootUserId, clouser: clouser)
    }
    
    func getMessages(forChat chat:Chat, clouser: @escaping ([Message]) -> ()) {
        DBManager.messageService.getMessageInternet(chatId: chat.id, version: 0, clouser: clouser)
    }

}
