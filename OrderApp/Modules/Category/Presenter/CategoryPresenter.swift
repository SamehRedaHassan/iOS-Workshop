//
//  CategoryPresenter.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation

class CategoryPresenter: CategoryPresenterProtocol {
    //MARK: - Properties
    var networkManager: NetworkingProtocol
    var categories: [String] = []
    let view: CategoryViewProtocl
    
    //MARK: - Life Cycle
    init(networkManager: NetworkingProtocol = NetworkManager(), view: CategoryViewProtocl) {
        self.view = view
        self.networkManager = networkManager
    }
    
    //MARK: - functions
    func getCategories() {
        networkManager.request(fromEndpoint: .categories, httpMethod: .GET, param: nil) { [weak self] (result:Result<CategoriesResponse, Error>) in
            switch result {
            case .success(let response):
                self?.categories = response.categories
                DispatchQueue.main.async {
                    self?.view.reloadTableView()
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getCategory(index: Int) -> String{
        return categories[index]
    }
    
    func getCount() -> Int{
        return categories.count
    }
}
