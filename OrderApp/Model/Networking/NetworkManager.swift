//
//  NetworkManager.swift
//  OrderApp
//
//  Created by admin on 2/25/22.
//  Copyright © 2022 admin. All rights reserved.
//

import Foundation

class NetworkManager : NetworkingProtocol {
    
 
    
    //MARK: - properties
     var baseURL = "http://localhost:8080/"


    //MARK: - HttpMethod
    func request<T>(fromEndpoint: EndPoint, httpMethod: HttpMethod, param: [String : Any]? = nil,queryIrtems: [String : String]? ,completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let completionOnMain: (Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }

        guard let urll = URL(string: "\(baseURL)\(fromEndpoint.rawValue)") else {
            completionOnMain(.failure(ManagerErrors.invalidUrl))
            return
        }
        
        
        var components = URLComponents(url: urll, resolvingAgainstBaseURL: false)
        if let queryItem = queryIrtems{
            components?.queryItems = queryItem.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            
        }
        guard let url = components?.url else{return}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
      
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
               request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        if let params = param {
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
         
        }

        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            // Remember, and 404, 500, 501 http error code does not result in an error in URLSession, it
            // will only return an error here in case of e.g. Network timeout.
            if let error = error {
                completionOnMain(.failure(error))
                return
            }

            guard let urlResponse = response as? HTTPURLResponse else { return completionOnMain(.failure(ManagerErrors.invalidResponse)) }
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(ManagerErrors.invalidStatusCode(urlResponse.statusCode)))
            }

            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                debugPrint(response)
                completionOnMain(.success(response))
            } catch {
                debugPrint("Could not translate the data to the requested type. Reason: \(error.localizedDescription)")
                completionOnMain(.failure(error))
            }
        }
        urlSession.resume()
    }
}
