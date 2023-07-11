//
//  ChooseAvatarViewController.swift
//  iOSTraining
//
//  Created by Димон on 15.06.23.
//

import UIKit

final class ChooseAvatarViewController: UIViewController {
    
    @IBOutlet private weak var spiderAvatarImageView: UIImageView!
    @IBOutlet private weak var personAvatarImageView: UIImageView!
    @IBOutlet private weak var crownAvatarImageView: UIImageView!
    @IBOutlet private weak var starAvatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spiderTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.chooseAvatarAction))
        let personTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.chooseAvatarAction))
        let crownTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.chooseAvatarAction))
        let starTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.chooseAvatarAction))
        
        spiderAvatarImageView.addGestureRecognizer(spiderTapGesture)
        personAvatarImageView.addGestureRecognizer(personTapGesture)
        crownAvatarImageView.addGestureRecognizer(crownTapGesture)
        starAvatarImageView.addGestureRecognizer(starTapGesture)
    }
    
    @objc private func chooseAvatarAction(recognizer: UITapGestureRecognizer) {
        let customizeViewController = getCustomizeViewController(navigationController)
        
        if recognizer.view is UIImageView {
            if let view = recognizer.view {
                let imageView = view as? UIImageView
                customizeViewController.delegate?.profile.avatarImage = imageView?.image
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
}
