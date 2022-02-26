//
//  OrderPresenterProtocol.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
protocol OrderPresenterProtocol {
    func getSharedItem(atIndex index : Int)->ItemProtocol
    func deleteItem(atIndex index : Int)
    func getItemsCount()->Int
    func submitOrder()
}
