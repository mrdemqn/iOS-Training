//
//  AddTeacherViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

final class AddTeacherViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    
    private let presenter: AddTeacherPresenterProtocol = AddTeacherPresenter()
    
    var reloadCompletion: (() -> Void)?
    
    @IBAction private func saveAction() {
        guard let name = nameTextField.text, name.trim.isNotEmpty,
              let lastName = lastNameTextField.text, lastName.trim.isNotEmpty else { return showAlert() }
        
        presenter.saveTeacher(name: name.trim,
                              lastName: lastName.trim) { [self] in
            reloadCompletion?()
            popToPreviousViewController()
        }
    }
}
