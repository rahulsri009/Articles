//
//  APIService.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import UIKit

public typealias APIServiceCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol APIService {
    func request(with endPoint:EndPoint, completion: @escaping APIServiceCompletion)
}
