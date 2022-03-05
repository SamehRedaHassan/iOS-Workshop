//
//  MenuuPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation


class MenuuPresenter : MenuuPresenterProtocol{
    //MARK: - Properties
    var networkManager: NetworkingProtocol
    var items: [ItemProtocol] = []
    var category : String
    let view: MenuuViewProtocol

    //MARK: - Life cycle
    init(networkManager: NetworkingProtocol,view :MenuuViewProtocol , category : String) {
        self.networkManager = networkManager
        self.view = view
        self.category = category
    }
    
    //MARK: - Functions
    func getMenu(){
        networkManager.request(fromEndpoint: .menu, httpMethod: .GET, param: nil, queryIrtems: ["category":category]) { [weak self] (result:Result<MenuResponse, Error>) in
            switch result {
            case .success(let response):
                self?.items = response.items
                DispatchQueue.main.async {
                    self?.view.reloadTableView()
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
    
    func getItem(forIndex index: Int) -> ItemProtocol {
        return items[index]
    }
    
    func getCount() -> Int{
        return items.count
    }
}

