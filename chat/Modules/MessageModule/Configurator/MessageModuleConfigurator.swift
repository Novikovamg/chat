//
//  MessageModuleMessageModuleConfigurator.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class MessageModuleConfigurator {

    func configureModuleForViewInput() -> MessageModulePresenter? {

        let router = MessageModuleRouter()

        let presenter = MessageModulePresenter()
        presenter.router = router

        let interactor = MessageModuleInteractor()
        interactor.output = presenter

        presenter.interactor = interactor

        return presenter
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, presenter: MessageModulePresenter){

        if let viewController = viewInput as? MessageModuleViewController {
            configure(viewController: viewController, presenter: presenter)
        }
    }

    private func configure(viewController: MessageModuleViewController, presenter: MessageModulePresenter) {
        presenter.view = viewController
        viewController.output = presenter
    }

}
