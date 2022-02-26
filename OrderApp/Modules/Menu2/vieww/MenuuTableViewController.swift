//
//  MenuuTableViewController.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import UIKit

class MenuuTableViewController: UITableViewController {
    
    //MARK: - Properties
    var presenter: MenuuPresenterProtocol!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getMenu()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        cell.textLabel?.text = presenter.getName(forIndex: indexPath.row)
        cell.detailTextLabel?.text = "\(presenter.getPrice(forIndex: indexPath.row))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = self.storyboard?.instantiateViewController(identifier: String(describing: MenuDetailsViewController.self)) as! MenuDetailsViewController
        let destPresenter = MenuDetailsPresenter(menuItem: presenter.getItem(forIndex: indexPath.row), view: destVC)
        destVC.presenter = destPresenter
        self.navigationController?.pushViewController(destVC, animated: true)
    }
}
//MARK: - Extensions
extension MenuuTableViewController : MenuuViewProtocol{
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
