//
//  prefixLoginModuleprefixLoginModuleConfigurator.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class LoginModuleModuleConfigurator {

    func configureModule() -> LoginModulePresenter? {

        let router = LoginModuleRouter()
        
        let presenter = LoginModulePresenter()
        presenter.router = router
        
        let interactor = LoginModuleInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        return presenter
    }
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, presenter: LoginModulePresenter){
        
        if let viewController = viewInput as? LoginModuleViewController {
            configure(viewController: viewController, presenter: presenter)
        }
    }
    
    private func configure(viewController: LoginModuleViewController, presenter: LoginModulePresenter) {
        presenter.view = viewController
        viewController.output = presenter
        presenter.router.chatModulePresenter = AppDependencies.initializers[ChatModuleInitializer.identifier]?.presenter as? ChatModuleInput
    }

}

