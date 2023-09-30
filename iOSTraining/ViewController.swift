//
//  ViewController.swift
//  BusinessCardApplication
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction private func showBusinessCardAction(_ sender: Any) {
        getAndPushViewController(BusinessCardViewController.self, NavigationKeys.businessCard)
    }
}

