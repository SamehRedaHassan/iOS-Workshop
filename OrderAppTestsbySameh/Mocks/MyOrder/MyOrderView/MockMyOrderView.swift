//
//  MyOrderViewMock.swift
//  OrderAppTestsbySameh
//
//  Created by admin on 3/4/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
@testable import OrderApp
class MockMyOrderView :OrderTableViewProtocol{
    var didShowConfirmationAlert = false
    
    
    func showConfirmationAlert(prepTime: Int) {
        didShowConfirmationAlert = true
    } 
    
}
