//
//  extensions.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

extension UIView {
    func roundWithBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.init(red: 127, green: 22, blue: 126, alpha: 1.0).cgColor
        layer.masksToBounds = false
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}
