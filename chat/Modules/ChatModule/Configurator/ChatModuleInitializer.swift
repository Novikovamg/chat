//
//  ChatModuleChatModuleInitializer.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class ChatModuleInitializer: NSObject, InitializerOutput {
    
    static let identifier = "ChatModuleViewController"

    //Connect with object on storyboard
    @IBOutlet weak var viewController: UIViewController!
    var presenter: Presenter? = nil
    
    override func awakeFromNib() {

        let configurator = ChatModuleConfigurator()

        if (presenter != nil) {
            configurator.configureModuleForViewInput(viewInput: viewController, presenter: presenter! as! ChatModulePresenter)
            
        } else {
            presenter = configurator.configureModuleForViewInput()
        }

    }

}
