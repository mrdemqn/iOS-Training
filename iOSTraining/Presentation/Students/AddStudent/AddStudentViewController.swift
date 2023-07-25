//
//  AddStudentViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

final class AddStudentViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    
    @IBOutlet private weak var chooseTeacherButton: UIButton!
    
    private var presenter: AddStudentPresenterProtocol = AddStudentPresenter()
    
    var reloadCompletion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        
        nameTextField.delegate = self
        ageTextField.delegate = self
    }
    
    @IBAction private func chooseTeacherAction() {
        let viewController = getViewController(ChooseTeacherViewController.self,
                                               NavigationKeys.chooseTeacherScreen)
        viewController.saveCompletion = saveTeacher(_:)
        push(viewController)
    }
    
    @IBAction func saveStudentAction() {
        guard let name = nameTextField.text, name.trim.isNotEmpty,
              let age = ageTextField.text, age.trim.isNotEmpty else { return showAlert() }
        
        let teacher = presenter.teacher
        
        presenter.saveStudent(name: name.trim,
                              age: age.trim,
                              teacher: teacher) { [self] in
            reloadCompletion?()
            popToPreviousViewController()
        }
    }
}

extension AddStudentViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.isNumbers
    }
}

extension AddStudentViewController {
    
    private func saveTeacher(_ teacher: Teacher) {
        presenter.saveChosenTeacher(teacher)
    }
    
    func changeButton() {
        guard let teacher = presenter.teacher else { return }
        let title = "Selected: \(teacher.convertTitle().string)"
        chooseTeacherButton.setTitle(title, for: .normal)
    }
}
