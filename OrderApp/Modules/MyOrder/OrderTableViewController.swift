//
//  OrderTableViewController.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {

    
    var presenter : OrderPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = OrderTableViewPresenter()
    NotificationCenter.default.addObserver(tableView!,
               selector: #selector(updateUI),
               name:  Notification.Name("UPDATE ORDER"), object: nil)

    }
    

    // MARK: - Table view data source

    @objc func updateUI(){
        self.tableView.reloadData()
        
    }
    
    @IBAction func submitButtonPressed(_ sender: UIBarButtonItem) {
        let orderTotal =
            SharedMenu.sharedItems.reduce(0.0)
               { (result, menuItem) -> Double in
                return result + menuItem.price
            }
        //let orderTotal = 50;
            //let formattedTotal = orderTotal.formatted(.currency(code: "usd"))
    
            let alertController = UIAlertController(title:
               "Confirm Order", message: "You are about to submit your order with a total of \(orderTotal)",
               preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "Submit",
               style: .default, handler: {[weak self] _ in
                self?.presenter.submitOrder()
              //  self.updateUI()
            }))
    
            alertController.addAction(UIAlertAction(title: "Cancel",
               style: .cancel, handler: nil))
    
            present(alertController, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
            // Delete the row from the data source
            self.tableView.beginUpdates()
            presenter.deleteItem(atIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
