//
//  OrderPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
class OrderTableViewPresenter: OrderPresenterProtocol{
 
    var networkManager : NetworkingProtocol!
    
    init(){
        networkManager = NetworkManager()
        
    }
    func getSharedItem(atIndex index: Int)->MenuItem {
        return SharedMenu.sharedItems[index]
    }
    
    func getItemsCount()-> Int{
        return  SharedMenu.sharedItems.count
    }
    
    
    func deleteItem(atIndex : Int) {
        SharedMenu.sharedItems.remove(at: atIndex)
        //NotificationCenter.default.post(name:Notification.Name("UPDATE ORDER"), object: nil)
    }
    
    func submitOrder() {
        let ids = SharedMenu.sharedItems.map { (menuItem) -> Int in
            return menuItem.id
        }
        networkManager.request(fromEndpoint: .order, httpMethod: .POST, param: ["menuIds" : ids]) { (result:Result<OrderResponse, Error>) in
                   switch result {
                   case .success(let response):
                    print(response.prepTime)
                   case .failure(let error):
                       print(error.localizedDescription)
                   }
               }
     }
    
    
    
}
