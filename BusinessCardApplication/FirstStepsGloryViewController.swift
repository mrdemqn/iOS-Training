//
//  FirstStepsGloryViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

class FirstStepsGloryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        let backToBeginningButton = UIBarButtonItem(title: "Начало", style: .plain, target: self, action: #selector(goToTheBeginningAction))
        backButton.title = "Биография"
        navigationItem.title = "Первые шаги к славе"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = backToBeginningButton
    }
    
    @objc func goToTheBeginningAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}
