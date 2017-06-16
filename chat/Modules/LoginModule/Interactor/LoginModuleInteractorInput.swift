//
//  prefixLoginModuleprefixLoginModuleInteractorInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol LoginModuleInteractorInput {
    
    func logInAccount(login: String, password: String, clouser: @escaping (Int64)->())
    func getChats(id:Int64, clouser: @escaping ([Chat])->())
}
