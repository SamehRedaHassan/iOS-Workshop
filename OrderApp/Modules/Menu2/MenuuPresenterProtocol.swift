//
//  MenuuPresenterProtocol.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//




protocol MenuuPresenterProtocol{
    func getMenu()
    func getName(forIndex index: Int) -> String
    func getPrice(forIndex index: Int) -> Double
    func getItem(forIndex index: Int)-> MenuItem
    func getCount() -> Int
}
