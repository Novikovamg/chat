//
//  ChatModuleChatModuleConfigurator.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class ChatModuleConfigurator {

    func configureModuleForViewInput() -> ChatModulePresenter? {
        
        let router = ChatModuleRouter()
        
        let presenter = ChatModulePresenter()
        presenter.router = router
        
        let interactor = ChatModuleInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        
        return presenter
    }

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, presenter: ChatModulePresenter){

        if let viewController = viewInput as? ChatModuleViewController {
            configure(viewController: viewController, presenter: presenter)
        }
    }

    private func configure(viewController: ChatModuleViewController, presenter: ChatModulePresenter) {
        presenter.view = viewController
        viewController.output = presenter
        presenter.router.messageModule = AppDependencies.initializers[MessageModuleInitializer.identifier]!.presenter as! MessageModuleInput
    }

}
