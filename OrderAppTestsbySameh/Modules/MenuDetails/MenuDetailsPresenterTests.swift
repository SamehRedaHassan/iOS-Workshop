//
//  MenuDetailsPresenterTests.swift
//  OrderAppTestsbySameh
//
//  Created by Thoraya Hamdy on 12/14/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
@testable import OrderApp
import XCTest

class MenuDetailsPresenterTests: XCTestCase{
    var sut: MenuDetailsPresenter!
    var view: MockMenuDetailsView!
    override func setUp() {
        super.setUp()
        view = MockMenuDetailsView()
        sut = MenuDetailsPresenter(menuItem: MenuItem(id: 5, name: "Chicken Noodle Soup", detailText: "Chicken simmered alongside yellow onions, carrots, celery, and bay leaves.", price: 3.5, category: "soups", imageURL: "http://localhost:8080/images/5.png"), view: view)
    }
    override func tearDown() {
        sut = nil
        view = nil
        super.tearDown()
    }
    
    func testGetItemDetails(){
        let item = sut.getItemDetails()
        XCTAssertEqual(item.name, "Chicken Noodle Soup")
    }
    
    func testAddItemToOrder(){
        sut.addItemToOrder()
        XCTAssertEqual(SharedMenu.sharedItems[0].name, "Chicken Noodle Soup")
    }
    func testWhenViewIsSet(){
        XCTAssertNotNil(sut.view)
    }
    func testWhenItemIsSet(){
        XCTAssertNotNil(sut.item)
    }
}
