//
//  MockMenuDetailsPresenter.swift
//  OrderAppTestsbySameh
//
//  Created by Thoraya Hamdy on 12/14/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
@testable import OrderApp

class MockMenuDetailsPresenter : MenuDetailsPresenterProtocol{
    var item = MenuItem(id: 5, name: "Chicken Noodle Soup", detailText: "Chicken simmered alongside yellow onions, carrots, celery, and bay leaves.", price: 3.5, category: "soups", imageURL: "http://localhost:8080/images/5.png")
    
    var view : MenuDetailsViewProtocol!

    func getItemDetails() -> ItemProtocol {
        return item
    }
    
    func addItemToOrder() {
        SharedMenu.sharedItems.append(item)
        NotificationCenter.default.post(name:Notification.Name("UPDATE Padge"), object: nil)
    }
    
    
    
}
