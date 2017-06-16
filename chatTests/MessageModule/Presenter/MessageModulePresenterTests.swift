//
//  MessageModuleMessageModulePresenterTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 11/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class MessageModulePresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: MessageModuleInteractorInput {

    }

    class MockRouter: MessageModuleRouterInput {

    }

    class MockViewController: MessageModuleViewInput {

        func setupInitialState() {

        }
    }
}
