//
//  AddChatModuleAddChatModulePresenter.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class AddChatModulePresenter: Presenter, AddChatModuleInput, AddChatModuleViewOutput, AddChatModuleInteractorOutput {

    weak var view: AddChatModuleViewInput!
    var interactor: AddChatModuleInteractorInput!
    var router: AddChatModuleRouterInput!
    
    var chats: [Chat] = []

    func viewIsReady() {

    }

    func back() {
        view = nil
    }
    
    func getChatCount() -> Int {
        return chats.count
    }
    
    func getChat(identifier: Int) -> Chat {
        return chats[identifier]
    }
    
    func didSelectRow(index:Int) {
        let interlocutorId = chats[index].id
        interactor.postChat(userId: DBManager.rootUserId, interlocutorId: interlocutorId) { chat in
            self.router.sendChatToChatModule(chat: chat)
            self.view.dismiss()
        }
    }
    
    func searchButtonClicked(searchString: String) {
        interactor.getChats(searchString: searchString) { chats in
            self.chats = chats
            self.view.reloadData()
        }
    }
    
}
