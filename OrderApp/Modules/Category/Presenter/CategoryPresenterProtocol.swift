//
//  CategoryPresenterProtocol.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation

protocol CategoryPresenterProtocol {
    var networkManager: NetworkingProtocol {get set}
    func getCategories()
    func getCategory(index: Int) -> String
    func getCount() -> Int
}
