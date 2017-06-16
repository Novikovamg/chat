//
//  prefixLoginModuleprefixLoginModuleConfiguratorTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 08/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class LoginModuleModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = LoginModuleViewControllerMock()
        let configurator = LoginModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "LoginModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is LoginModulePresenter, "output is not LoginModulePresenter")

        let presenter: LoginModulePresenter = viewController.output as! LoginModulePresenter
        XCTAssertNotNil(presenter.view, "view in LoginModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in LoginModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is LoginModuleRouter, "router is not LoginModuleRouter")

        let interactor: LoginModuleInteractor = presenter.interactor as! LoginModuleInteractor
        XCTAssertNotNil(interactor.output, "output in LoginModuleInteractor is nil after configuration")
    }

    class LoginModuleViewControllerMock: LoginModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
