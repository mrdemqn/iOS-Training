//
//  CustomizeViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

final class CustomizeViewController: UIViewController {
    
    @IBOutlet private weak var avatarPlaceholderView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    var delegate: ProfileDelegate?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setProfileData()
        switchImagePlaceholder()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let profile = delegate?.profile {
            delegate?.saveProfile(profile: profile)
            dismiss(animated: true)
        }
    }
    
    @IBAction func routeEditAction(_ sender: Any) {
        let viewController = NavigationHelper.receiveViewController("ChooseGenderStoryboard", "ChooseGenderViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func cancelEditAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func switchImagePlaceholder() {
        if delegate?.profile.avatarImage != nil {
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
    
    private func setProfileData() {
        if let profile = delegate?.profile {
            avatarImageView.image = profile.avatarImage
            nicknameLabel.text = profile.nickname
        }
    }
}
