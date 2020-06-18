//
//  URLParameterEncoding.swift
//  DeliveryApp
//
//  Created by Arun Jose on 23/09/18.
//  Copyright © 2018 Arun Jose. All rights reserved.
//

import Foundation

struct URLParameterEncoding:ParameterEncoder{
    
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        if let url = urlRequest.url, var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty{
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters{
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
    }
}
