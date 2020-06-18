//
//  Extensions.swift
//  Articles
//
//  Created by Rahul on 18/06/20.
//  Copyright © 2020 Articles. All rights reserved.
//

import UIKit

extension UITableViewCell {
    open class var reuseIdentifier: String {
        get {
            return "\(self.self)"
        }
    }
    
    public static func registerWithTableView(_ tableView: UITableView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier , bundle: bundle)
        tableView.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
}

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return 0 }
        set(radius) {
            layer.cornerRadius = radius
            self.clipsToBounds = true
        }
    }
}

extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
}
