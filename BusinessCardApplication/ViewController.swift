//
//  ViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func showBusinessCardAction(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "BusinessCardStoryboard", bundle: nil)
        let businessCardVC = mainStoryboard.instantiateViewController(withIdentifier: "BusinessCardViewController")
    
        navigationController?.pushViewController(businessCardVC, animated: true)
    }
}

