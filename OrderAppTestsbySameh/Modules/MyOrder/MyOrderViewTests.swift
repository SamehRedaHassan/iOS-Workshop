//
//  MyOrderViewTests.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/4/22.
//  Copyright © 2022 admin. All rights reserved.
//


import XCTest
@testable import OrderApp
class MyOrderViewViewTests : XCTestCase {
    
    private var sut: OrderTableViewController!
    
    override func setUp() {
        super.setUp()
        sut = OrderTableViewController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSUT_ShouldSetTableViewDelegate() {
        
        XCTAssertNotNil(sut.tableView.delegate)
      }
      
      func testSUT_ShouldSetTableViewDatasource() {
        
        XCTAssertNotNil(sut.tableView.dataSource)
      }
      
      func testSut_whenViewDidLoadCalled_categoryPresenterIsSet() {
          // When
          sut.loadViewIfNeeded()
          
          // Then
          XCTAssertNotNil(sut.presenter)
      }
      
      func testSut_startsWithEmptyTableView() {
          XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
      }
      
      func testSut_whenGetCategoriesAndReloadTableIsCalled_tableViewIsFilled() {
          let presenter = MockOrderPresenter()
          sut.presenter = presenter
          sut.loadViewIfNeeded()
        
          
          XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
      }
      
    func testSut_whenCellForRowIsCalled_cellIsReturnedWithCorrectData() {
          // Given
          
          // To register the cell with the table view
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          sut = storyboard.instantiateViewController(withIdentifier: "OrderTableViewController") as? OrderTableViewController
          
         sut.presenter = MockOrderPresenter()
        SharedMenu.sharedItems.append(sut.presenter.getSharedItem(atIndex: 0))

          
          // When
          let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
          
          // Then
          XCTAssertEqual(cell.textLabel?.text, "Spaghetti and Meatballs")
      }
    
    func testSut_WhenUpdateOccurs_tableViewIsReloaded(){
        
        
        
        
    }
    
}
class MockOrderPresenter: OrderPresenterProtocol {
    func getSharedItem(atIndex index: Int) -> ItemProtocol {
        return MenuItem(id:  1, name: "Spaghetti and Meatballs", detailText: "Seasoned meatballs on top of freshly-made spaghetti. Served with a robust tomato sauce.", price:  9, category: "entrees", imageURL: "http://localhost:8080/images/1.png")
    }
    
    func deleteItem(atIndex index: Int) {
        SharedMenu.sharedItems.remove(at: index)
    }
    
    func getItemsCount() -> Int {
        SharedMenu.sharedItems.count
    }
    
    func submitOrder() {
        
    }
    
   
}
