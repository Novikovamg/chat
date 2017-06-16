//
//  prefixLoginModuleprefixLoginModuleInitializer.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject, InitializerOutput {
    
    static let identifier = "LoginModuleViewController"

    //Connect with object on storyboard
    @IBOutlet weak var viewController: UIViewController!
    var presenter: Presenter? = nil

    override func awakeFromNib() {

        let configurator = LoginModuleModuleConfigurator()
        
        if (presenter != nil) {
            configurator.configureModuleForViewInput(viewInput: viewController, presenter: presenter! as! LoginModulePresenter)
        } else {
            presenter = configurator.configureModule()
        }
    }

}
