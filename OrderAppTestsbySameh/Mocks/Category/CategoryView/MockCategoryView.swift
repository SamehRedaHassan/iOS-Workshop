//
//  MockCategoryView.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/4/22.
//  Copyright © 2022 admin. All rights reserved.
//

import XCTest
@testable import OrderApp

class MockCategoryView: CategoryViewProtocl {
    var isTableReloaded = false
    
    func reloadTableView() {
        isTableReloaded = true
    }
}

