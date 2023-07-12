//
//  BusinessCardViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class BusinessCardViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    @IBAction private func showChildhoodAndYouthAction() {
        getAndPushViewController(ChildhoodAndYouthViewController.self, NavigationKeys.childHoodAndYouth)
    }
    
    @IBAction private func showFirstStepsGloryAction() {
        getAndPushViewController(FirstStepsGloryViewController.self, NavigationKeys.firstSteps)
    }
    
    @IBAction private func showQueenAction() {
        getAndPushViewController(QueenViewController.self, NavigationKeys.queen)
    }
    
    private func setupNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = "Визитка"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
