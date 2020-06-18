//
//  EndPoint.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import UIKit

protocol EndPoint {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod:HTTPMethod { get }
    var httpHeaders:HTTPHeaders { get }
    var parameters:ParameterEncoding { get }
}

public typealias HTTPHeaders = [String : String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
