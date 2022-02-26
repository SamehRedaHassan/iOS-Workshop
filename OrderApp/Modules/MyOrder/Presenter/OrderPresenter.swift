//
//  OrderPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
class OrderTableViewPresenter: OrderPresenterProtocol{
 
    //MARK: - Properties
    var networkManager : NetworkingProtocol
    var view    : OrderTableViewProtocol
    
    //MARK: - Life Cycle
    init(networkManager : NetworkingProtocol = NetworkManager(), view : OrderTableViewProtocol){
        self.view = view
        self.networkManager = networkManager
    }
    
    //MARK: - Functions
    func getSharedItem(atIndex index: Int)->ItemProtocol {
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
        networkManager.request(fromEndpoint: .order, httpMethod: .POST, param: ["menuIds" : ids]) {[weak self] (result:Result<OrderResponse, Error>) in
                   switch result {
                   case .success(let response):
                    self?.view.showConfirmationAlert(prepTime: response.prepTime)
                    SharedMenu.sharedItems.removeAll()
                   case .failure(let error):
                       print(error.localizedDescription)
                   }
               }
     }
}
