//
//  MockMenuPresenter.swift
//  OrderAppTestsThoraya
//
//  Created by Thoraya Hamdy on 12/13/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
@testable import OrderApp

class MockMenuPresenter: MenuuPresenterProtocol{
    var networkManager: NetworkingProtocol = MockNetworkManager(fileName: "MenuData")
    var items: [MenuItem]! = []
    
    func getMenu(){
        items.append(MenuItem(id: 5, name: "Chicken Noodle Soup", detailText: "Chicken simmered alongside yellow onions, carrots, celery, and bay leaves.", price: 3.5, category: "soups", imageURL: "http://localhost:8080/images/5.png"))
    }
    
    func getName(forIndex index: Int) -> String {
        return index < items.count ? items[index].name : ""
    }
    
    func getPrice(forIndex index: Int) -> Double {
        return index < items.count ? items[index].price : 0.0
    }
    
    func getItem(forIndex index: Int) -> ItemProtocol {
        return items[0]
    }
    
    func getCount() -> Int {
        return items.count
    }
    
    
}

