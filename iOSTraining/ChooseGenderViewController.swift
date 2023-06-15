//
//  ChooseGenderViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

class ChooseGenderViewController: UIViewController {
    
    @IBAction private func chooseGenderAction(_ sender: UIButton) {
        let customizeViewController = NavigationHelper.receiveCustomizeViewController(navigationController)
        customizeViewController?.profile?.gender = sender.titleLabel?.text ?? ""
        
        let viewController = NavigationHelper.receiveViewController("ChooseNicknameStoryboard", "ChooseNicknameViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
