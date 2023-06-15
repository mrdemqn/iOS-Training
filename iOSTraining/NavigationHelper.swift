//
//  NavigationHelper.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

class NavigationHelper {
    static func receiveViewController(_ storyBoardIdentifier: String,
                                      _ viewControllerIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardIdentifier, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
    
    static func receiveCustomizeViewController(_ navigationController: UINavigationController?) -> CustomizeViewController? {
        return navigationController?.viewControllers.first { $0 is CustomizeViewController } as? CustomizeViewController
    }
}
