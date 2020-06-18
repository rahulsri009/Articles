//
//  Media.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

struct Media: Codable {
    var id: String
    var blogId: String
    var createdAt: String
    var image: String
    var title: String
    var url: String
}
