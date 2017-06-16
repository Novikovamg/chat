//
//  MessageModuleMessageModulePresenter.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

class MessageModulePresenter: Presenter, MessageModuleInput, MessageModuleViewOutput, MessageModuleInteractorOutput {

    weak var view: MessageModuleViewInput!
    var interactor: MessageModuleInteractorInput!
    var router: MessageModuleRouterInput!
    
    var messages: [Message] = []
    private var chatId: Int64 = -1
    private var version: Int64 = 0
    
    var timer : Timer?

    func viewIsReady() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateMessages), userInfo: nil, repeats: true)
        view.reloadData()
    }
    
    func setMesages(messages: [Message]) {
        self.messages = messages
    }
    
    func getText(index:Int)->String {
        return messages[index].text
    }
    
    func isUserMessage(index:Int)->Bool {
        return messages[index].userId == DBManager.rootUserId
    }

    func getCount() -> Int {
        return messages.count
    }
    
    func didSelect(index: Int) {
        
    }
    
    func setVersion(version:Int64) {
        self.version = version
    }
    
    func sendMessage(text:String) {
        interactor.postMessage(text: text) { message in
            if (self.version != message.version) {
                self.version = message.version
                self.messages.append(message)
                self.view.reloadData()
                self.view.scrollDown(animated: true)
            }
        }
    }
    
    func setChatId(id: Int64) {
        chatId = id
    }
    
    func getChatId() -> Int64 {
        return chatId
    }
    
    @objc func updateMessages() {
        if chatId > -1 {
            interactor.getMessages(chatId: chatId, version: version) { messages in
                if let message = messages.last {
                    if (self.version != message.version) {
                        self.messages.append(contentsOf: messages)
                        self.version = message.version
                        self.view.reloadData()
                        self.view.scrollDown(animated: true)
                    }
                }
                
            }
        }
    }
    
    func back() {
        view = nil
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
}
