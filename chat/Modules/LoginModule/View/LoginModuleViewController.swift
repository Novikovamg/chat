//
//  LoginModuleprefixLoginModuleViewController.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import UIKit

class LoginModuleViewController: UIViewController, LoginModuleViewInput {

    var output: LoginModuleViewOutput!
    @IBOutlet weak var loginTextField: UITextField!
    //@IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //output.viewIsReady()
    }
    

    @IBAction func joinButtonPressed(_ sender: Any) {
        let login = loginTextField.text
        //let password = passwordTextField.text
        if (login != "" ) { //&& password != ""){
            output.sendLogin(login: login!, password: "123")
        }
    }

    // MARK: LoginModuleViewInput
    func setupInitialState() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated : Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        if (self.isMovingFromParentViewController){
            output.back()
        }
    }
    
    func sendAlertUserDosentExist() {
        let alertController = UIAlertController(title: "Wrong login", message:"This user dosen't exist!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
