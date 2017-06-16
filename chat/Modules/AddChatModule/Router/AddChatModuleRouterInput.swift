//
//  AddChatModuleAddChatModuleRouterInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol AddChatModuleRouterInput {
    var chatModulePresenter: ChatModuleInput? {get set}
    
    func sendChatToChatModule( chat: Chat)
}
