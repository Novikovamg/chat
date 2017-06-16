//
//  AddChatModuleAddChatModuleConfiguratorTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class AddChatModuleModuleConfiguratorTests: XCTestCase {

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
        let viewController = AddChatModuleViewControllerMock()
        let configurator = AddChatModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AddChatModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AddChatModulePresenter, "output is not AddChatModulePresenter")

        let presenter: AddChatModulePresenter = viewController.output as! AddChatModulePresenter
        XCTAssertNotNil(presenter.view, "view in AddChatModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AddChatModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AddChatModuleRouter, "router is not AddChatModuleRouter")

        let interactor: AddChatModuleInteractor = presenter.interactor as! AddChatModuleInteractor
        XCTAssertNotNil(interactor.output, "output in AddChatModuleInteractor is nil after configuration")
    }

    class AddChatModuleViewControllerMock: AddChatModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
