//
//  AddChatModuleAddChatModuleInteractorInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol AddChatModuleInteractorInput {
    
    func getChats(searchString:String,  clouser: @escaping ([Chat])->())
    func postChat(userId: Int64, interlocutorId: Int64, clouser: @escaping (Chat)->())
}
