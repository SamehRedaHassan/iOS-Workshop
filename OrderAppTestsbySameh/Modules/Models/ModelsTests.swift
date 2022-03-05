//
//  ModelsTests.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/5/22.
//  Copyright © 2022 admin. All rights reserved.
//


import XCTest
@testable import OrderApp

class ModelsTests: XCTestCase{

    
    override func setUp(){
        super.setUp()

   
    }

    override func tearDown(){
   
        super.tearDown()
    }
    func testWhenOrderModelinitialized_orderInstanceReturns(){

        let menuItem = MenuItem(id: 5, name: "Chicken Noodle Soup", detailText: "Chicken simmered alongside yellow onions, carrots, celery, and bay leaves.", price: 3.5, category: "soups", imageURL: "http://localhost:8080/images/5.png")
        let instance = Order(menuItems: [menuItem])
        XCTAssertNotNil(instance)
    }
    
    
    func testSharedItemsStartsEmpty_emptyArrayReturns(){

        XCTAssertEqual(SharedMenu.sharedItems.count, 0)
    }
}
