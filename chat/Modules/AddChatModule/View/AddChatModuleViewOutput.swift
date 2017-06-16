//
//  AddChatModuleAddChatModuleViewOutput.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol AddChatModuleViewOutput {

    /**
        @author Viktor Novikov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func back()
    func searchButtonClicked(searchString: String)
    
    func getChatCount() -> Int
    func getChat(identifier: Int) -> Chat
    func didSelectRow(index:Int)
}
