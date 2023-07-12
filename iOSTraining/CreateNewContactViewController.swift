//
//  CreateNewContactViewController.swift
//  iOSTraining
//
//  Created by Димон on 11.07.23.
//

import UIKit

final class CreateNewContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextFIeld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Contact"
    }
    
    var saveCompletion: ((Person) -> Void)?
    
    @IBAction private func cancelAction() {
        popViewController()
    }
    
    @IBAction private func saveAction() {
        guard let name = nameTextField.text,
                name.trimmingLeadingAndTrailingSpaces().isNotEmpty,
              let surname = surnameTextFIeld.text,
                surname.trimmingLeadingAndTrailingSpaces().isNotEmpty else { return }
        
        let trimName = name.trimmingLeadingAndTrailingSpaces()
        let trimSurname = surname.trimmingLeadingAndTrailingSpaces()
        
        let person = Person(firstName: trimName, lastName: trimSurname)
        
        saveCompletion?(person)
        popViewController()
    }
}
