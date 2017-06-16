//
//  ChatModuleChatModuleModuleInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol ChatModuleInput: class {
    
    func setChats(_ chats : [Chat])
    func setChat(_ chat : Chat)
}
