//
//  MenuDetailsViewTests.swift
//  OrderAppTestsbySameh
//
//  Created by Thoraya Hamdy on 12/14/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
@testable import OrderApp
import XCTest

class MenuDetailsViewTests: XCTestCase {
    var sut: MenuDetailsViewProtocol!
    var presenter: MockMenuDetailsPresenter!
    
    override func setUp() {
        super.setUp()
        sut = MenuDetailsViewController()
        
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
//    func testWhenPresenterIsSet(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        sut = storyboard.instantiateViewController(withIdentifier: "MenuDetailsViewController") as? MenuDetailsViewController
//
//        sut.presenter = MockMenuDetailsPresenter()
//        sut.configureUI()
//        XCTAssertNotNil(sut.presenter)
//    }
}
