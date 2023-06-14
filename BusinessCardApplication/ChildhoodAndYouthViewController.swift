//
//  ChildhoodAndYouthViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

class ChildhoodAndYouthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        let backToBeginningButton = UIBarButtonItem(title: "Начало", style: .plain, target: self, action: #selector(goToTheBeginningAction))
        backButton.title = "Биография"
        navigationItem.title = "Детство и Юность"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationItem.rightBarButtonItem = backToBeginningButton
    }
    
    @objc func goToTheBeginningAction() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func showPhotoAction(_ sender: Any) {
        let childhoodYouthPhotoStoryboard = UIStoryboard(name: "ChildhoodAndYouthPhotoStoryboard", bundle: nil)
        let childhoodYouthPhotoVC = childhoodYouthPhotoStoryboard.instantiateViewController(withIdentifier: "ChildhoodAndYouthPhotoViewController")
        navigationController?.pushViewController(childhoodYouthPhotoVC, animated: true)
    }
}
