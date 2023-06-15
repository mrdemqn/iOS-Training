//
//  ViewController.swift
//  iOSTraining
//
//  Created by Димон on 14.06.23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var avatarPlaceholderView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    var profile = Profile.init()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switchImagePlaceholder()
    }
    
    @IBAction func routeCustomizeAction(_ sender: Any) {
        let viewController = NavigationHelper.receiveViewController("CustomizeStoryboard", "CustomizeViewController") as! CustomizeViewController
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.delegate = self
        viewController.profile = profile
        
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
            avatarPlaceholderView.backgroundColor = UIColor.init(red: 242, green: 242, blue: 242, alpha: 1.0)
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
