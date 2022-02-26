//
//  OrderTableViewController.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController , OrderTableViewProtocol{
    
    //MARK: - Properties
    var presenter : OrderPresenterProtocol!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = OrderTableViewPresenter(view: self)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateUI),
                                               name:  Notification.Name("UPDATE ORDER"), object: nil)
        
    }
    
    // MARK: - Functions
    @objc func updateUI(){
        self.tableView.reloadData()
    }
    
    func showConfirmationAlert(prepTime: Int) {
        let alert = UIAlertController(title: "Your order Recieved", message: "thank you for submitting your order , estimated preparation time is \(prepTime) minutes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    // MARK: - IBActions
    @IBAction func submitButtonPressed(_ sender: UIBarButtonItem) {
        let orderTotal =
            SharedMenu.sharedItems.reduce(0.0)
            { (result, menuItem) -> Double in
                return result + menuItem.price
        }
        let alertController = UIAlertController(title:
            "Confirm Order", message: "You are about to submit your order with a total of \(orderTotal)",
            preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Submit",
                                                style: .default, handler: {[weak self] _ in
                                                    self?.presenter.submitOrder()
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel",
                                                style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let item = presenter.getSharedItem(atIndex: indexPath.row)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.price) $"
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableView.beginUpdates()
            presenter.deleteItem(atIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
            NotificationCenter.default.post(name:Notification.Name("UPDATE Padge"), object: nil)
        }
    }
}
