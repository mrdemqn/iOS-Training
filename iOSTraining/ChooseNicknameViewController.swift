//
//  ChooseNicknameViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

final class ChooseNicknameViewController: UIViewController {
    
    @IBOutlet private weak var firstNicknameButton: UIButton!
    @IBOutlet private weak var secondNicknameButton: UIButton!
    @IBOutlet private weak var thirdNicknameButton: UIButton!
    @IBOutlet private weak var fourthNicknameButton: UIButton!
    
    private var customizeViewController: CustomizeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViewController = NavigationHelper.receiveCustomizeViewController(navigationController)
        defineTextButtons()
    }
    
    @IBAction private func chooseNicknameAction(_ sender: UIButton) {
        customizeViewController?.delegate?.profile.nickname = sender.titleLabel?.text ?? ""
        
        let viewController = NavigationHelper.receiveViewController("ChooseAvatarStoryboard", "ChooseAvatarViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func defineTextButtons() {
        if customizeViewController?.delegate?.profile.isMale == false {
            firstNicknameButton.setTitle("Fox", for: .normal)
            secondNicknameButton.setTitle("Mirror", for: .normal)
            thirdNicknameButton.setTitle("Queen", for: .normal)
            fourthNicknameButton.setTitle("Candy", for: .normal)
        }
    }
}
