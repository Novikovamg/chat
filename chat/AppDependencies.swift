//
//  AppDependencies.swift
//  chat
//
//  Created by Виктор Новиков on 09.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation

import UIKit

class AppDependencies {
    
    static var window: UIWindow?
    static let sharedInstance = AppDependencies()
    
    static var initializers : [String : InitializerOutput] = [:]
    
    init() {
        AppDependencies.initializers[LoginModuleInitializer.identifier] = LoginModuleInitializer()
        AppDependencies.initializers[ChatModuleInitializer.identifier] = ChatModuleInitializer()
        AppDependencies.initializers[MessageModuleInitializer.identifier] = MessageModuleInitializer()
        AppDependencies.initializers[AddChatModuleInitializer.identifier] = AddChatModuleInitializer()
        
        for initializer in AppDependencies.initializers {
            initializer.value.awakeFromNib()
        }
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        AppDependencies.window = window
        
        addViewControllerToWindow(withIdentifier: "LoginModuleViewController")
    }
    
    
    func addViewControllerToWindow(withIdentifier identifier: String){
        
        if AppDependencies.window != nil {
            
            for var (name, initializer) in AppDependencies.initializers {
                
                if name == identifier {
                    
                    let viewController = getViewController(withIdentifier : identifier)
                    
                    initializer.viewController = viewController
                    initializer.awakeFromNib()
                    
                    let navigationController = AppDependencies.window!.rootViewController as! UINavigationController
                    navigationController.viewControllers.append(viewController)
                }
            }
        }
        
    }
    
    func getViewController(withIdentifier identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        return viewController
    }
}
