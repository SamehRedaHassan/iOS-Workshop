//
//  ViewController.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {
    //MARK: - Properties
   lazy var presenter: CategoryPresenterProtocol = CategoryPresenter(view: self)
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       // presenter = CategoryPresenter(view: self)
        presenter.getCategories()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = presenter.getCategory(index: indexPath.row)
        return cell
    }
 
    // MARK: - Navigation    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let destVC = segue.destination as! MenuuTableViewController
            let menuPresenter = MenuuPresenter(networkManager: NetworkManager(), view: destVC, category: presenter.getCategory(index: indexPath.row))
           destVC.presenter = menuPresenter
        }
    }
}
// MARK: - Extensions
extension CategoryViewController: CategoryViewProtocl {
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
