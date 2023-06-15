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
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let redCGFloat = CGFloat(red) / 255
        let greenCGFloat = CGFloat(green) / 255
        let blueCGFloat = CGFloat(blue) / 255
        
        self.init(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat, alpha: alpha)
    }
}
