//
//  Menu2ViewTests.swift
//  OrderAppTestsThoraya
//
//  Created by Thoraya Hamdy on 12/13/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation

import XCTest
@testable import OrderApp

class Menu2ViewTests: XCTestCase{
    var sut: MenuuTableViewController!
    
    override func setUp(){
        super.setUp()
        sut = MenuuTableViewController()
        sut.presenter = MockMenuPresenter()
        
    }
    override func tearDown(){
        sut = nil
        super.tearDown()
    }
    
    func testTableViewDelegate(){
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewDatasource(){
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testwhenViewDidLoadIsCalled_MenuPresenterIsSet(){
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.presenter)
    }
    
    func testInitialTableViewWithNoRows(){
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testWhenGetMenuAndReloadTableIsCalled_tableViewIsFilled() {
        let presenter = MockMenuPresenter()
        sut.presenter = presenter
        sut.presenter.getMenu()
        
        sut.loadViewIfNeeded()
        sut.reloadTableView()
        
        print("presenter count = \(presenter.getCount())")
        
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), presenter.getCount())
    }
    
    func testWhenCellForRowIsCalled_cellIsReturnedWithCorrectData() {
        // Given
        
        // To register the cell with the table view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MenuuTableViewController") as? MenuuTableViewController
        
        sut.presenter = MockMenuPresenter()
        sut.presenter.getMenu()
        
        // When
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(cell.textLabel?.text, sut.presenter.getName(forIndex: 0))
    }
    func testSut_whenSeguePerformed_detailsViewControllerIsPresented(){
        // To register the cell with the table view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "MenuuTableViewController") as? MenuuTableViewController
        sut.presenter = MockMenuPresenter()
        let window = UIWindow()
        let navCon = UINavigationController(rootViewController: sut)
        window.rootViewController = navCon
        sut.loadViewIfNeeded()
        
         _ = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Act
        RunLoop.current.run(until: Date())//delay
        
        // Assert
        guard let _ =  navCon.topViewController as? MenuDetailsViewController else {
            XCTFail()
            return
        }

    }
    
    
    
    
    
}


