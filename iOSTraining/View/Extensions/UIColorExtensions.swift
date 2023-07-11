//
//  UIColorExtensions.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let redCGFloat = CGFloat(red) / 255
        let greenCGFloat = CGFloat(green) / 255
        let blueCGFloat = CGFloat(blue) / 255
        
        self.init(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat, alpha: alpha)
    }
    
    static var appGrey: UIColor {
        return UIColor(named: "AppGrey")!
    }
}
