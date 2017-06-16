//
//  AddChatModuleAddChatModuleInteractor.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class AddChatModuleInteractor: AddChatModuleInteractorInput {

    weak var output: AddChatModuleInteractorOutput!

    func getChats(searchString:String,  clouser: @escaping ([Chat])->()) {
        DBManager.chatService.getChatBySearchString(searchString: searchString, clouser: clouser)
    }
    
    func postChat(userId: Int64, interlocutorId: Int64, clouser: @escaping (Chat)->()) {
        DBManager.chatService.postChat(userId: userId, interlocutorId: interlocutorId, clouser: clouser)
    }
}
