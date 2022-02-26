//
//  SharedItems.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
protocol MenuController {
    static var sharedItems : [ItemProtocol] {get set}
}
