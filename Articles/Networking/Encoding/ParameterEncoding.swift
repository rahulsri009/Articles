//
//  ParameterEncoding.swift
//  Dating
//
//  Created by Rahul on 08/04/20.
//  Copyright © 2020 Talocity. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    case json(parameters: Parameters?)
    
    public func encode(urlRequest: inout URLRequest) throws {
        switch self {
        case .json(let parameters):
            guard let parameters = parameters else { return }
            try URLParameterEncoding().encode(urlRequest: &urlRequest, with: parameters)
        }
    }
}
