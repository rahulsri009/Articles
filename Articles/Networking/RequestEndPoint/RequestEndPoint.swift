//
//  RequestEndPoint.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import UIKit

public enum Environment {
    case production
}

public enum RequestEndPoint {
    case getAtricles(page: Int, limit: Int)
}

extension RequestEndPoint: EndPoint {
    
    var environmentBaseURL: String {
        return BaseUrl.production
    }
    
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("Base URL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .getAtricles(_, _):
            return APIPath.getArticles
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var httpHeaders: HTTPHeaders {
        let headers: HTTPHeaders = ["Content-Type":"application/json"]
        return headers
    }
    
    var parameters: ParameterEncoding {
        switch self {
        case .getAtricles(let page, let limit):
            return ParameterEncoding.json(parameters: ["page" : "\(page)", "limit" : "\(limit)"])
        }
    }
}
