//
//  ChatModuleChatModuleConfiguratorTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 09/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class ChatModuleModuleConfiguratorTests: XCTestCase {

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
        let viewController = ChatModuleViewControllerMock()
        let configurator = ChatModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ChatModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ChatModulePresenter, "output is not ChatModulePresenter")

        let presenter: ChatModulePresenter = viewController.output as! ChatModulePresenter
        XCTAssertNotNil(presenter.view, "view in ChatModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ChatModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ChatModuleRouter, "router is not ChatModuleRouter")

        let interactor: ChatModuleInteractor = presenter.interactor as! ChatModuleInteractor
        XCTAssertNotNil(interactor.output, "output in ChatModuleInteractor is nil after configuration")
    }

    class ChatModuleViewControllerMock: ChatModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
