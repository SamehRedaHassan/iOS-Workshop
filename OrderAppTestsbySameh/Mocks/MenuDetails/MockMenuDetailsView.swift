//
//  MockMenuDetailsView.swift
//  OrderAppTestsbySameh
//
//  Created by Thoraya Hamdy on 12/14/1400 AP.
//  Copyright © 1400 admin. All rights reserved.
//

import Foundation
import UIKit
@testable import OrderApp

class MockMenuDetailsView: MenuDetailsViewProtocol {
    var presenter: MockMenuDetailsPresenter!
    var item: ItemProtocol!
    func configureUI() {
        item =   presenter.getItemDetails()
    }
    
    
}
