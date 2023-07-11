//
//  ViewController.swift
//  iOSTraining
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var avatarPlaceholderView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    @IBOutlet private weak var tabBar: UITabBar!
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    var profile: Profile = Profile()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switchImagePlaceholder()
    }
    
    @IBAction func routeCustomizeAction() {
        let viewController = getViewController(CustomiseViewController.self,
                                                    NavigationKeys.customise)
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.delegate = self
        viewController.delegate?.profile = self.profile
        
        present(navigation, animated: true)
    }
    
    private func switchImagePlaceholder() {
        if profile.avatarImage != nil {
            avatarPlaceholderView.isHidden = true
            avatarImageView.isHidden = false
            avatarImageView.roundWithBorder()
        } else {
            avatarPlaceholderView.isHidden = false
            avatarImageView.isHidden = true
            avatarPlaceholderView.roundWithBorder()
            avatarPlaceholderView.backgroundColor = .appGrey
        }
    }
}

extension MainViewController: ProfileDelegate {
    func saveProfile(profile: Profile) {
        avatarImageView.image = profile.avatarImage
        nicknameLabel.text = profile.nickname
        self.profile = profile
    }
}
