//
//  MangerErrors.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
//MARK: - ManagerErrors
enum ManagerErrors: Error {
    case invalidUrl
    case invalidResponse
    case invalidStatusCode(Int)
}
