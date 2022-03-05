//
//  Menu2PresenterTests.swift
//  OrderAppTestsThoraya
//
//  Created by Thoraya Hamdy on 12/13/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import XCTest
@testable import OrderApp

class Menu2PresenterTests: XCTestCase{
    private var sut: MenuuPresenter!
    private var menu2View: MockMenuView!
    
    override func setUp(){
        super.setUp()
        menu2View = MockMenuView()
        sut = MenuuPresenter(networkManager: MockNetworkManager(fileName: "MenuData"), view: menu2View, category: "soups")
   
    }

    override func tearDown(){
        sut = nil
        menu2View = nil
        super.tearDown()
    }
    func testWhenInitIsCalled_menuViewIsSet(){
        XCTAssertNotNil(sut.view)
    }
    
    func testWhenGetMenuIsCalled_menuDataIsFilled(){
        sut.getMenu()
        XCTAssertNotEqual(sut.items.count, 0)
    }
    
    func testwhenGetMenuCalledWithFailure_MenuItemsStillEmpty(){
        sut = MenuuPresenter(networkManager:  MockNetworkManager(fileName: "Error"), view: menu2View, category: "soups")
        sut.getMenu()
        XCTAssertEqual(sut.items.count, 0)
    }
    
    func testWhenMenuCountCalled_MenuCountIsReturned(){
        sut.getMenu()
        let menuCount = sut.getCount()
        XCTAssertEqual(menuCount, 1)
    }
     
    func testWhenGetPriceIsCalled_MenuItemPriceAtIndexReturned(){
        
        sut.getMenu()
        let price = sut.getPrice(forIndex: 0)
        XCTAssertEqual(price, 3.5)
    }
    
    func testWhenGetNameIsCalled_MenuItemNameAtIndexReturned(){
        
        sut.getMenu()
        let name = sut.getName(forIndex: 0)
        XCTAssertEqual(name, "Chicken Noodle Soup")
    }
    func testWhenGetItemIsCalled_MenuItemAtIndexReturned(){
        
        sut.getMenu()
        let name = sut.getItem(forIndex: 0).name
        XCTAssertEqual(name, "Chicken Noodle Soup")
    }
}
