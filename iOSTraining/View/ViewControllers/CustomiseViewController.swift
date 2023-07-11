//
//  CustomizeViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

final class CustomiseViewController: UIViewController {
    static var storyboard: UIStoryboard = UIStoryboard(name: "ChooseGenderStoryboard", bundle: nil)
    
    
    @IBOutlet private weak var avatarPlaceholderView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    var delegate: ProfileDelegate?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setProfileData()
        switchImagePlaceholder()
    }
    
    @IBAction private func saveAction() {
        guard let profile = delegate?.profile else { return }
        delegate?.saveProfile(profile: profile)
        dismiss(animated: true)
    }
    
    @IBAction private func routeEditAction() {
        let controller = getViewController(ChooseGenderViewController.self,
                                           NavigationKeys.chooseGender)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func cancelEditAction() {
        dismiss()
    }
    
    private func switchImagePlaceholder() {
        guard delegate?.profile.avatarImage != nil else {
            avatarPlaceholderView.isHidden = false
            avatarImageView.isHidden = true
            avatarPlaceholderView.roundWithBorder()
            avatarPlaceholderView.backgroundColor = .appGrey
            return
        }
        
        avatarPlaceholderView.isHidden = true
        avatarImageView.isHidden = false
        avatarImageView.roundWithBorder()
    }
    
    private func setProfileData() {
        guard let profile = delegate?.profile  else { return }
        avatarImageView.image = profile.avatarImage
        nicknameLabel.text = profile.nickname
    }
}
