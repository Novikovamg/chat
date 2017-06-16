//
//  ChatModuleChatModuleRouter.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class ChatModuleRouter: ChatModuleRouterInput {
    
    var messageModule: MessageModuleInput?
    
    func sendMessagesToMessageModule( messages: [Message]) {
        messageModule!.setMesages(messages: messages)
    }

    func setChatIdToMessageModule( id: Int64) {
        messageModule?.setChatId(id: id)
    }
    
    func setVersionToMessageModule( version: Int64) {
        messageModule?.setVersion(version: version)
    }
}
