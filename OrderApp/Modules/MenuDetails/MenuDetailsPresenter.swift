//
//  MenuDetailsPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
class MenuDetailsPresenter : MenuDetailsPresenterProtocol {
 
    
    var item : MenuItem
    var view : MenuDetailsViewProtocol
    var networkManager : NetworkManager!
    init(menuItem : MenuItem , view : MenuDetailsViewProtocol){
        self.view = view
        self.item = menuItem
        self.networkManager = NetworkManager()
    }
    
    func getItemDetails() -> MenuItem {
         return item
     }
    
    func addItemToOrder(){
        SharedMenu.sharedItems.append(item)
       NotificationCenter.default.post(name:Notification.Name("UPDATE ORDER"), object: nil)
     
    }
    
    
    
    
    
}
