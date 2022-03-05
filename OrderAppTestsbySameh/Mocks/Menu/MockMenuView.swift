//
//  MockMenuPresenter.swift
//  OrderAppTestsThoraya
//
//  Created by Thoraya Hamdy on 12/13/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
@testable import OrderApp

class MockMenuView: MenuuViewProtocol{
    var isTableReloaded = false
    
    func reloadTableView() {
        isTableReloaded = true
    }
}
