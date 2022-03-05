//
//  CategoryPresenterTests.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/4/22.
//  Copyright © 2022 admin. All rights reserved.
//

import XCTest
@testable import OrderApp

class CategoryPresenterTests: XCTestCase {
    private var sut: CategoryPresenter!
    private var categoryView: MockCategoryView!
    
    override func setUp() {
        super.setUp()
        categoryView = MockCategoryView()
        sut = CategoryPresenter(networkManager: MockNetworkManager(fileName: "Categories"), view: categoryView)
    }
    
    override func tearDown() {
        sut = nil
        categoryView = nil
        super.tearDown()
    }
    
    func testSut_whenInitCalled_categoryViewIsSet() {
        
        // Then
        XCTAssertNotNil(sut.view)
    }
    
    func testSut_whenGetCategoriesCalled_categoriesAreFilled() {
                
        // When
        sut.getCategories()
        
        // Then
        XCTAssertNotEqual(sut.categories, [])
    }
    
    func testSut_whengetCategoryCountCalled_correctCategoryIsReturned() {
          
          // Given
          sut.getCategories()
          
          // When
          let categoryListCount = sut.getCount()
          
          // Then
          XCTAssertEqual(categoryListCount, 6)

      }
    
    func testSut_whengetCategoryAtIndexCalled_correctCategoryIsReturned() {
        
        // Given
        sut.getCategories()
        
        // When
        let firstCategory = sut.getCategory(index: 0)
        
        // Then
        XCTAssertEqual(firstCategory, "appetizers")
    }
    
  
    
    func testSut_whenGetCategoriesCalledWithFailure_categoriesStillEmpty() {
        // Given
        sut = CategoryPresenter(networkManager: MockNetworkManager(fileName: "Error"), view: categoryView)
        
        // Then
        sut.getCategories()
        
        // Then
        XCTAssertEqual(sut.categories, [])

    }
}

