//
//  OrderAppTestsThoraya.swift
//  OrderAppTestsThoraya
//
//  Created by Thoraya Hamdy on 12/7/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//


import XCTest
@testable import OrderApp

class OrderAppTests: XCTestCase {
    
    var networkManager = NetworkManager()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadCategoriesFromAPI() throws {
        
        let expect = expectation(description: "Waiting for loading categories from the API")
        networkManager.request(fromEndpoint: .categories, httpMethod: .GET, param: nil) { (result:Result<CategoriesResponse, Error>) in
            
            switch result {
            case .success(let response):
                XCTAssertTrue((response.categories.count) > 0, "Categories data not found")
                expect.fulfill()
            case .failure(_):
                XCTFail()
            }
            
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testLoadMenuItemsFromAPI() throws {
        
        let expect = expectation(description: "Waiting for loading menu items from the API")
        networkManager.request(fromEndpoint: .menu, httpMethod: .GET, param: nil) { (result:Result<MenuResponse, Error>) in
            
            switch result {
            case .success(let response):
                XCTAssertTrue((response.items.count) > 0, "Menu data not found")
                expect.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}

