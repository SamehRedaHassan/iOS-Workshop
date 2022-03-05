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
        
    }
    
     func getOrderIds()->[Int]{
        return  SharedMenu.sharedItems.map { (menuItem) -> Int in
                 return menuItem.id
        }
    }
    
    
    func submitOrder() {
        networkManager.request(fromEndpoint: .order, httpMethod: .POST, param: ["menuIds" : getOrderIds()], queryIrtems: nil) {[weak self] (result:Result<OrderResponse, Error>) in
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
