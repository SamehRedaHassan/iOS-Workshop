//
//  MenuuPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation


class MenuuPresenter : MenuuPresenterProtocol{
 
   var networkManager: NetworkingProtocol
    var items: [MenuItem] = []
    let view: MenuuViewProtocol!
    var category : String!
    
    init(view :MenuuViewProtocol , category : String) {
        networkManager = NetworkManager()
        self.view = view
        self.category = category
    }
    
    func getMenu(){
        networkManager.request(fromEndpoint: .menu, httpMethod: .GET, param: nil) { [weak self] (result:Result<MenuResponse, Error>) in
            switch result {
            case .success(let response):
                self?.items = response.items
                DispatchQueue.main.async {
                    self?.view?.reloadTableView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func getName(forIndex index: Int) -> String {
        
       return items[index].name
    }
    func getPrice(forIndex index: Int) -> Double{
        return items[index].price

        
    }
    func getItem(forIndex index: Int) -> MenuItem {
           return items[index]
     }

    func getCount() -> Int{
        return items.count
    }
}

