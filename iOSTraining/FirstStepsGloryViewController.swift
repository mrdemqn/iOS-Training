//
//  FirstStepsGloryViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class FirstStepsGloryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    @objc private func goToTheBeginningAction() {
        popToRootViewController()
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        let backToBeginningButton = UIBarButtonItem(title: "Начало", style: .plain, target: self, action: #selector(goToTheBeginningAction))
        backButton.title = "Биография"
        navigationItem.title = "Первые шаги к славе"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = backToBeginningButton
    }
}
