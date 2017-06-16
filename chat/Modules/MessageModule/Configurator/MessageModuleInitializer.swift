//
//  MessageModuleMessageModuleInitializer.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class MessageModuleInitializer: NSObject, InitializerOutput {

    static let identifier = "MessageModuleViewController"

    //Connect with object on storyboard
    @IBOutlet weak var viewController: UIViewController!
    var presenter: Presenter? = nil

    override func awakeFromNib() {

        let configurator = MessageModuleConfigurator()

        if (presenter != nil) {
            configurator.configureModuleForViewInput(viewInput: viewController, presenter: presenter! as! MessageModulePresenter)
        } else {
            presenter = configurator.configureModuleForViewInput()
        }

    }

}
