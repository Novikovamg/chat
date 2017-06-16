//
//  MessageModuleMessageModuleInteractorInput.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import Foundation

protocol MessageModuleInteractorInput {
    
    func getMessages( chatId:Int64, version:Int64, clouser:@escaping ([Message])->())
    func postMessage(text:String, clouser:@escaping (Message)->())

}
