//
//  MyOrder.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/4/22.
//  Copyright © 2022 admin. All rights reserved.
//

import XCTest
@testable  import OrderApp

class MyOrderPresenterTests: XCTestCase {
    
    private var sut: OrderTableViewPresenter!
    private var orderView: MockMyOrderView!
    
    override func setUp() {
        super.setUp()
        orderView = MockMyOrderView()
        sut = OrderTableViewPresenter(networkManager: MockNetworkManager(fileName: "OrderModel"), view: orderView)
    }
    
    override func tearDown() {
        sut = nil
        orderView = nil
        SharedMenu.sharedItems = []
        super.tearDown()
    }
    
    func testSut_whenInitCalled_orderViewIsSet() {
        
        // Then
        XCTAssertNotNil(sut.view)
    }
    
    func testSut_whenGetSharedItemsCalled_itemsAreReturned() {
        //given
        let item = MenuItem(id: 0, name: "item1", detailText: "item1 Detail", price: 20.2, category: "item1 CAtegory", imageURL: "item1 Url")
        SharedMenu.sharedItems.append(item)
        //when
        let result = sut.getSharedItem(atIndex: 0)
        XCTAssertEqual(result.detailText, "item1 Detail")
        
    }
    
    func testSut_whengetItemsCountCalled_correctNumberIsReturned() {
        
        //when
        let res =  sut.getItemsCount()
        
        //Then
        XCTAssertEqual(res, 0)
        
        
    }
    
    func testSut_whengetCategoryAtIndexCalled_correctCategoryIsReturned() {
        
        
        
        
        //given
        let item = MenuItem(id: 0, name: "item1", detailText: "item1 Detail", price: 20.2, category: "item1 CAtegory", imageURL: "item1 Url")
        SharedMenu.sharedItems.append(item)
        //when
        // When
        let res =   sut.getSharedItem(atIndex: 0)
        
        
        // Then
        XCTAssertEqual(res.name, item.name)
    }
    
    
    
    func testSut_whenRemovingOrderItem_itemGotDeleted() {
        // Given
        let item = MenuItem(id: 0, name: "item1", detailText: "item1 Detail", price: 20.2, category: "item1 CAtegory", imageURL: "item1 Url")
        SharedMenu.sharedItems.append(item)
        
        // Then
        sut.deleteItem(atIndex: 0)
        
        // Then
        XCTAssertEqual(SharedMenu.sharedItems.count, 0)
        
    }
    
    func testSut_whenSubmittingOrderSuccessfully_alertIsShow() {
        // Given
        
        
        // Then
        sut.submitOrder()
        
        // Then
        XCTAssertEqual(orderView.didShowConfirmationAlert, true)
    }
    
    
    func testSut_whenSubmittingOrderFailure_alertNotShown() {
        // Given
        
        sut = OrderTableViewPresenter(networkManager: MockNetworkManager(fileName: "Error"), view: orderView)
        // Then
        sut.submitOrder()
        
        // Then
        XCTAssertEqual(orderView.didShowConfirmationAlert, false)
    }
    func testSut_gettingIdsSuccessfully_arrayOfIdsReturns() {
           // Given
           
           // Then
        let res = sut.getOrderIds()
           // Then
           XCTAssertEqual(res, [])
       }
    
}
