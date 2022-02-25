//
//  MenuDetailsViewController.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import UIKit

class MenuDetailsViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    // MARK: - Properties
    var presenter : MenuDetailsPresenterProtocol!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI() 
    }
    

   
    // MARK: - IBAction

    @IBAction func addTocartButtonPressed(sender : UIButton){
        presenter.addItemToOrder()
    }

}
extension MenuDetailsViewController : MenuDetailsViewProtocol{
    func configureUI() {
       let item =   presenter.getItemDetails()
        descriptionLabel.text = item.detailText
        priceLabel.text = "\(item.price)"
        nameLabel.text  = item.name
        itemImageView.load(url: item.imageURL)
    }
    
    
}

