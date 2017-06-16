//
//  MessageModuleMessageModuleInteractor.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class MessageModuleInteractor: MessageModuleInteractorInput {

    weak var output: MessageModuleInteractorOutput!
    
    func getMessages( chatId:Int64, version:Int64, clouser:@escaping ([Message])->()) {
        DBManager.messageService.getMessageInternet(chatId: chatId, version: version, clouser: clouser)
    }
    
    
    func postMessage(text:String, clouser:@escaping (Message)->()){
        DBManager.messageService.postMessageInternet(chatId: output.getChatId(), text: text, clouser: clouser)
    }

}
