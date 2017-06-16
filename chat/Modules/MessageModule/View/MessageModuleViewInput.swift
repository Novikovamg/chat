//
//  MessageModuleMessageModuleViewInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol MessageModuleViewInput: class {

    /**
        @author Viktor Novikov
        Setup initial state of the view
    */

    func setupInitialState()
    
    func reloadData()
    func scrollDown(animated: Bool)
}
