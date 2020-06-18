//
//  URLSessionAPIService.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import UIKit

class URLSessionAPIService: APIService {
    private var task:URLSessionTask?
    
    func request(with endPoint: EndPoint, completion: @escaping APIServiceCompletion) {
        let urlSession = URLSession.shared
        do {
            let urlRequest = try self.buildURLRequest(from: endPoint)
            task = urlSession.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
            task?.resume()
        } catch {
            completion(nil, nil, error)
        }
    }
    
    fileprivate func buildURLRequest(from endPoint: EndPoint) throws -> URLRequest {
        var urlRequest = URLRequest(url: endPoint.baseUrl.appendingPathComponent(endPoint.path))
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        try endPoint.parameters.encode(urlRequest: &urlRequest)
        add(headers: endPoint.httpHeaders, request: &urlRequest)
        return urlRequest
    }

    fileprivate func add(headers: HTTPHeaders, request: inout URLRequest) {
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
