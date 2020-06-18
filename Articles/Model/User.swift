//
//  User.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

struct User: Codable {
    var id: String
    var blogId: String
    var createdAt: String
    var name: String
    var avatar: String
    var lastname: String
    var city: String
    var designation: String
    var about: String
}
