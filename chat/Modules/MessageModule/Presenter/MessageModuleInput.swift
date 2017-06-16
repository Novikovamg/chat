//
//  MessageModuleMessageModuleModuleInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol MessageModuleInput: class {

    func setChatId(id:Int64)
    func setMesages(messages: [Message])
    func setVersion(version:Int64)
}
