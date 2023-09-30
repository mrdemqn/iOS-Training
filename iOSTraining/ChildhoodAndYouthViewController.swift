//
//  ChildhoodAndYouthViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class ChildhoodAndYouthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    @objc private func goToTheBeginningAction() {
        popToRootViewController()
    }
    
    @IBAction private func showPhotoAction(_ sender: Any) {
        getAndPushViewController(ChildhoodAndYouthPhotoViewController.self, NavigationKeys.childHoodAndYouthPhoto)
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        let backToBeginningButton = UIBarButtonItem(title: "Начало", style: .plain, target: self, action: #selector(goToTheBeginningAction))
        backButton.title = "Биография"
        navigationItem.title = "Детство и Юность"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = backToBeginningButton
    }
}
