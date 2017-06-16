//
//  AddChatModuleAddChatModuleViewInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol AddChatModuleViewInput: class {

    /**
        @author Viktor Novikov
        Setup initial state of the view
    */

    func setupInitialState()
    func reloadData()
    func dismiss()
}
