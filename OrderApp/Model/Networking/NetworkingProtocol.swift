//
//  NetworkingProtocol.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation
protocol NetworkingProtocol {
    var baseURL : String {get set}
    func request<T: Decodable>(fromEndpoint: EndPoint, httpMethod: HttpMethod, param: [String: Any]? ,queryIrtems: [String : String]?, completion: @escaping (Result<T, Error>) -> Void)
}
