//
//  AddChatModuleAddChatModuleConfigurator.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class AddChatModuleConfigurator {

    func configureModuleForViewInput() -> AddChatModulePresenter? {

        let router = AddChatModuleRouter()

        let presenter = AddChatModulePresenter()
        presenter.router = router

        let interactor = AddChatModuleInteractor()
        interactor.output = presenter

        presenter.interactor = interactor

        return presenter
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, presenter: AddChatModulePresenter){

        if let viewController = viewInput as? AddChatModuleViewController {
            configure(viewController: viewController, presenter: presenter)
        }
    }

    private func configure(viewController: AddChatModuleViewController, presenter: AddChatModulePresenter) {
        presenter.view = viewController
        viewController.output = presenter
        presenter.router.chatModulePresenter = AppDependencies.initializers[ChatModuleInitializer.identifier]?.presenter as? ChatModuleInput
    }

}
