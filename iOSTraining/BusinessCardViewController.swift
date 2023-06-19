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
        let backButton = UIBarButtonItem()
        backButton.title = "Визитка"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @IBAction func showChildhoodAndYouthAction(_ sender: Any) {
        let childhoodYouthStoryboard = UIStoryboard(name: "ChildhoodAndYouthStoryboard", bundle: nil)
        let childhoodYouthVC = childhoodYouthStoryboard.instantiateViewController(withIdentifier: "ChildhoodAndYouthViewController")
        navigationController?.pushViewController(childhoodYouthVC, animated: true)
    }
    
    @IBAction func showFirstStepsGloryAction(_ sender: Any) {
        let firstStepsGloryStoryboard = UIStoryboard(name: "FirstStepsGloryStoryboard", bundle: nil)
        let firstStepsGloryVC = firstStepsGloryStoryboard.instantiateViewController(withIdentifier: "FirstStepsGloryViewController")
        navigationController?.pushViewController(firstStepsGloryVC, animated: true)
    }
    
    @IBAction func showQueenAction(_ sender: Any) {
        let queenStoryboard = UIStoryboard(name: "QueenStoryboard", bundle: nil)
        let queenVC = queenStoryboard.instantiateViewController(withIdentifier: "QueenViewController")
        navigationController?.pushViewController(queenVC, animated: true)
    }
}
