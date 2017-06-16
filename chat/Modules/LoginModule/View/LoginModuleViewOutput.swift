//
//  LoginModuleprefixLoginModuleViewOutput.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol LoginModuleViewOutput {

    /**
        @author Viktor Novikov
        Notify presenter that view is ready
    */
    
    func sendLogin(login:String, password: String)
    func back()

    func viewIsReady()
}
