//
//  ChatModuleChatModuleRouterInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol ChatModuleRouterInput {
    
    var messageModule: MessageModuleInput? {set get}
    
    func sendMessagesToMessageModule( messages: [Message])
    func setChatIdToMessageModule( id: Int64)
    func setVersionToMessageModule( version: Int64)
}
