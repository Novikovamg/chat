//
//  AddChatModuleAddChatModuleInitializer.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class AddChatModuleInitializer: NSObject, InitializerOutput {

    static let identifier = "AddChatModuleViewController"

    //Connect with object on storyboard
    @IBOutlet weak var viewController: UIViewController!
    var presenter: Presenter? = nil

    override func awakeFromNib() {

        let configurator = AddChatModuleConfigurator()

        if (presenter != nil) {
            configurator.configureModuleForViewInput(viewInput: viewController, presenter: presenter! as! AddChatModulePresenter)
        } else {
            presenter = configurator.configureModuleForViewInput()
        }

    }

}
