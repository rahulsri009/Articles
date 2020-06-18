//
//  Article.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

struct Article: Codable {
    var id: String
    var createdAt: String
    var content: String
    var comments: Int
    var likes:Int
    var media: [Media]
    var user: [User]
}
