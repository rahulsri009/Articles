//
//  NetworkManager.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import UIKit

struct NetworkManager {
    static let environment: Environment = .production
    
    private var apiService = URLSessionAPIService()
    
    func request<T: Decodable>(with endPoint: EndPoint, modelType: T.Type, completion: @escaping (_ modelResponse: T?, _ error: String?) -> ()) {
        apiService.request(with: endPoint) { (data, response, error) in
            var responseModel:T?
            var errorDescription:String?
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    responseModel = try decoder.decode(modelType.self, from: data)
                } catch {
                    errorDescription = error.localizedDescription
                }
            } else if let error = error {
                errorDescription = error.localizedDescription
            } else {
                errorDescription = "error.localizedDescription"
            }
            DispatchQueue.main.async {
                completion(responseModel, errorDescription)
            }
        }
    }
}
