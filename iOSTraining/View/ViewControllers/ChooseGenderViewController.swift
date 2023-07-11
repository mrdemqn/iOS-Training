//
//  ChooseGenderViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

final class ChooseGenderViewController: UIViewController {
    
    @IBAction private func chooseGenderAction(_ sender: UIButton) {
        let customizeViewController = getCustomizeViewController(navigationController)
        customizeViewController.delegate?.profile.gender = sender.titleLabel?.text ?? ""
        
        let viewController = getViewController(ChooseNicknameViewController.self,
                                               NavigationKeys.chooseNickname)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

