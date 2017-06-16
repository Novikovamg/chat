//
//  MessageModuleMessageModuleConfiguratorTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class MessageModuleModuleConfiguratorTests: XCTestCase {

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
        let viewController = MessageModuleViewControllerMock()
        let configurator = MessageModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "MessageModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MessageModulePresenter, "output is not MessageModulePresenter")

        let presenter: MessageModulePresenter = viewController.output as! MessageModulePresenter
        XCTAssertNotNil(presenter.view, "view in MessageModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MessageModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MessageModuleRouter, "router is not MessageModuleRouter")

        let interactor: MessageModuleInteractor = presenter.interactor as! MessageModuleInteractor
        XCTAssertNotNil(interactor.output, "output in MessageModuleInteractor is nil after configuration")
    }

    class MessageModuleViewControllerMock: MessageModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
