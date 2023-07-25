//
//  UIViewControllerExtensions.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

extension UIViewController {
    
    /// MARK: - Необходимо, чтобы название Storyboard и Identifier ViewController'a были одинаковыми
    func getViewController<T>(_ type: T.Type,
                              _ identifier: String) -> T where T: UIViewController {
        let storyboard = UIStoryboard(name: String(describing: identifier), bundle: nil)
        
        guard let controller = storyboard
            .instantiateViewController(withIdentifier: String(describing: identifier)) as? T else {
            fatalError("ViewController is not type of \(String(describing: self))")
        }
        
        return controller
    }
    
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
    
    func popToRootViewController(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    func popToPreviousViewController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Warning!",
                                      message: "Please, fill the all fields.",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel)
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
