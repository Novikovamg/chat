//
//  LoginModuleprefixLoginModulePresenter.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

class LoginModulePresenter:Presenter, LoginModuleModuleInput, LoginModuleViewOutput, LoginModuleInteractorOutput {

    weak var view: LoginModuleViewInput!
    var interactor: LoginModuleInteractorInput!
    var router: LoginModuleRouterInput!

    func viewIsReady() {

    }
    
    //Получаем id пользователя, по нему все его чаты, отправляем их в ChatModule и открываем его
    func sendLogin(login:String, password:String) {
        interactor.logInAccount(login: login, password: password) { userId in
            if (userId == -1) {
                self.view.sendAlertUserDosentExist()
            } else {
                self.interactor.getChats(id: userId) { chats in
                    
                    self.router.sendChatsToChatModule(chats: chats)
                    AppDependencies.sharedInstance.addViewControllerToWindow(withIdentifier: "ChatModuleViewController")
                }
            }
        }
    }
    
    func back() {
        view = nil
    }
}
