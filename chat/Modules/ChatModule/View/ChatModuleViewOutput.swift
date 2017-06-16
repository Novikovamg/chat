//
//  ChatModuleChatModuleViewOutput.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol ChatModuleViewOutput {

    /**
        @author Viktor Novikov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func back()
    func addChatButtonPressed()
    
    func getChatCount() -> Int
    func getChat(identifier: Int) -> Chat
    func didSelectRow(index:Int)
}
