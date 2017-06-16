//
//  ChatModuleChatModuleInteractorInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol ChatModuleInteractorInput {
    
    func getChats(clouser: @escaping ([Chat])->())
    func getMessages(forChat:Chat, clouser: @escaping ([Message]) -> ())

}
