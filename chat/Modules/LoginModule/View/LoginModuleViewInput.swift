//
//  LoginModuleprefixLoginModuleViewInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol LoginModuleViewInput: class {

    /**
        @author Viktor Novikov
        Setup initial state of the view
    */

    func setupInitialState()
    func sendAlertUserDosentExist()
}
