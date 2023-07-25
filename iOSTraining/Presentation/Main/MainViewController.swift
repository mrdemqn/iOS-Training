//
//  ViewController.swift
//  iOSTraining
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func studentsListAction() {
        getAndPushViewController(StudentsViewController.self,
                                 NavigationKeys.studentsScreen)
    }
    
    @IBAction func teachersListAction() {
        getAndPushViewController(TeachersViewController.self,
                                 NavigationKeys.teachersScreen)
    }
}

