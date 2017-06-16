//
//  AddChatModuleAddChatModulePresenterTests.swift
//  OnMap
//
//  Created by Viktor Novikov on 15/06/2017.
//  Copyright © 2017 newsystem. All rights reserved.
//

import XCTest

class AddChatModulePresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: AddChatModuleInteractorInput {

    }

    class MockRouter: AddChatModuleRouterInput {

    }

    class MockViewController: AddChatModuleViewInput {

        func setupInitialState() {

        }
    }
}
