//
//  MenuItem.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
protocol ItemProtocol {
    var id : Int {get set}
    var name : String {get set}
    var detailText : String {get set}
    var price : Double {get set}
    var category : String {get set}
    var imageURL : String {get set}

}



struct MenuItem: Codable , ItemProtocol{
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}

