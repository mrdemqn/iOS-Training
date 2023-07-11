//
//  UIViewControllerExtensions.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
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
    
    func getCustomizeViewController(_ navigationController: UINavigationController?) -> CustomiseViewController {
        guard let viewController = navigationController?.viewControllers.first(where: { $0 is CustomiseViewController }),
              let controller = viewController as? CustomiseViewController else { fatalError("Could not find CustomiseViewController") }
        
        return controller
    }
    
    func dismiss(_ animated: Bool = true) {
        dismiss(animated: animated)
    }
}
