//
//  MessageModuleMessageModuleViewOutput.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

protocol MessageModuleViewOutput {

    /**
        @author Viktor Novikov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func back()
    
    func getText(index:Int)->String
    func isUserMessage(index:Int)->Bool
    func getCount()->Int
    func didSelect(index:Int)
    func sendMessage(text:String)
}
