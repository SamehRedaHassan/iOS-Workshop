//
//  MenuDetailsPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
class MenuDetailsPresenter : MenuDetailsPresenterProtocol {
    //MARK: - Properties
    var item : ItemProtocol
    var view : MenuDetailsViewProtocol
    
    //MARK: - life cycle
    init(menuItem : ItemProtocol , view : MenuDetailsViewProtocol){
        self.view = view
        self.item = menuItem
    }
    //MARK: - functions
    func getItemDetails() -> ItemProtocol {
         return item
     }
    
    func addItemToOrder(){
        SharedMenu.sharedItems.append(item)
       NotificationCenter.default.post(name:Notification.Name("UPDATE Padge"), object: nil)
    }
}
