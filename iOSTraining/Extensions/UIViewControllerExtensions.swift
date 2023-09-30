//
//  UIViewControllerExtensions.swift
//  iOSTraining
//
//  Created by Димон on 12.07.23.
//

import UIKit

extension UIViewController {
    
    /// MARK: - Необходимо, чтобы название Storyboard и Identifier ViewController'a были одинаковыми
    func getAndPushViewController<T>(_ type: T.Type,
                              _ identifier: String) where T: UIViewController {
        let storyboard = UIStoryboard(name: String(describing: identifier), bundle: nil)
        
        guard let controller = storyboard
            .instantiateViewController(withIdentifier: String(describing: identifier)) as? T else {
            fatalError("ViewController is not type of \(String(describing: self))")
        }
        
        push(controller)
    }
    
    func popToRootViewController(_ animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func push(_ viewController: UIViewController, _ animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

