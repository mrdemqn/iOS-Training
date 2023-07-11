//
//  UIViewControllerExtensions.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import UIKit

extension UIViewController {
    
    func popViewController(_ animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
}
