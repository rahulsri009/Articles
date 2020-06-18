//
//  LoadingTableViewCell.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        activityIndicator.startAnimating()
    }
}
