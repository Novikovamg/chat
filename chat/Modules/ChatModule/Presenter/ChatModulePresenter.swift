//
//  ChatModuleChatModulePresenter.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

class ChatModulePresenter:Presenter, ChatModuleInput, ChatModuleViewOutput, ChatModuleInteractorOutput {

    weak var view: ChatModuleViewInput!
    var interactor: ChatModuleInteractorInput!
    var router: ChatModuleRouterInput!
    
    
    var chats: [Chat] = []

    func viewIsReady() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.updateChats), userInfo: nil, repeats: true)
        self.view.reloadData()
    }
    
    func didSelectRow(index:Int) {
        interactor.getMessages(forChat: chats[index]) { messages in
            self.router.sendMessagesToMessageModule(messages: messages)
            self.router.setChatIdToMessageModule(id: self.chats[index].id)
            self.router.setVersionToMessageModule(version: self.chats[index].version!)
            AppDependencies.sharedInstance.addViewControllerToWindow(withIdentifier: MessageModuleInitializer.identifier)
        }
    }
    
    func back() {
        view = nil
    }
    
    func addChatButtonPressed() {
        AppDependencies.sharedInstance.addViewControllerToWindow(withIdentifier: AddChatModuleInitializer.identifier)
    }
    
    func setChats(_ chats : [Chat]) {
        self.chats = chats
    }
    
    func setChat(_ chat : Chat) {
        chats.append(chat)
        view.reloadData()
    }
    
    func getChatCount() -> Int {
        return chats.count
    }
    
    func getChat(identifier: Int) -> Chat {
        return chats[identifier]
    }
    
    @objc func updateChats() {
        if DBManager.rootUserId > -1 {
            interactor.getChats() { chats in
                self.chats = chats
                if (self.view != nil){
                    self.view.reloadData()
                }
            }
        }
    }
}
