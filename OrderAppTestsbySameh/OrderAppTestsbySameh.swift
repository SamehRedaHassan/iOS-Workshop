//
//  OrderAppTestsbySameh.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 2/26/22.
//  Copyright © 2022 admin. All rights reserved.
//

import XCTest
@testable import OrderApp

class OrderAppTestsbySameh: XCTestCase {
    
    var networkManager : NetworkingProtocol!
    
    
    override  func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        super.tearDown()
        networkManager = nil
    }
    
    func testSubmitOrdeCall() throws {
        let expect = expectation(description: "Submit order to the server")
        networkManager.request(fromEndpoint: .order, httpMethod: .POST, param: ["menuIds":[1]]) { (result:Result<OrderResponse, Error>) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.prepTime, 20)
                expect.fulfill()
            case .failure(_):
                XCTFail()
            }
            
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
 
    
}
