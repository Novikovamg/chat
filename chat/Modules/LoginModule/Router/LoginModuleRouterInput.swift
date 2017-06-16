//
//  LoginModuleprefixLoginModuleRouterInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol LoginModuleRouterInput {
    
    var chatModulePresenter: ChatModuleInput? {set get}
    
    func sendChatsToChatModule( chats: [Chat])

}
