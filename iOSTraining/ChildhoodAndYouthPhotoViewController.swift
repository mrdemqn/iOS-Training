//
//  ChildhoodAndYouthPhotoViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class ChildhoodAndYouthPhotoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    @objc private func goToTheBeginningAction() {
        popToRootViewController()
    }
    
    private func setupNavigationBar() {
        let backToBeginningButton = UIBarButtonItem(title: "Начало", style: .plain, target: self, action: #selector(goToTheBeginningAction))
        navigationItem.rightBarButtonItem = backToBeginningButton
    }
}
