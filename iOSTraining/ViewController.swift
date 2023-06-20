//
//  ViewController.swift
//  iOSTraining
//
//  Created by Димон on 14.06.23.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet private weak var usernameErrorLabel: UILabel!
    @IBOutlet private weak var passwordErrorLabel: UILabel!
    @IBOutlet private weak var repeatPasswordErrorLabel: UILabel!
    
    private let regex: NSRegularExpression = try! .init(pattern: "(?=.*[0-9])(?=.*[!@#%$^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#%^&*]")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        repeatPasswordTextField.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case usernameTextField:
                passwordTextField.becomeFirstResponder()
            case passwordTextField:
                let checkPassword = checkPasswordValidation()
                passwordErrorLabel.text = checkPassword.1.rawValue
                repeatPasswordTextField.becomeFirstResponder()
            default:
                repeatPasswordTextField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction private func usernameEditingChangedAction(_ textfield: UITextField) {
        clearErrorLabels()
    }
    
    @IBAction private func passwordEditingChangedAction(_ textfield: UITextField) {
        clearErrorLabels()
        let checkPassword = checkPasswordValidation()
        if checkPassword.0 {
            repeatPasswordTextField.isEnabled = true
        } else if repeatPasswordTextField.isEnabled {
            repeatPasswordTextField.isEnabled = false
        }
    }
    
    @IBAction private func repeatPasswordEditingChangedAction(_ textfield: UITextField) {
        clearErrorLabels()
    }
    
    @IBAction private func doneAction(_ sender: Any) {
        let checkUsername = checkUsernameValidation()
        let checkPassword = checkPasswordValidation()
        let checkRepeatPassword = checkRepeatPasswordValidation()
        
        usernameErrorLabel.text = checkUsername.1.rawValue
        passwordErrorLabel.text = checkPassword.1.rawValue
        repeatPasswordErrorLabel.text = checkRepeatPassword.1.rawValue
        
        unfocusAllTextFields()
        
        if checkUsername.0 && checkPassword.0 && checkRepeatPassword.0 {
            let alert: UIAlertController = createAlert()
            present(alert, animated: true)
        }
    }
    
    private func checkUsernameValidation() -> (Bool, ValidationCases) {
        let validation = validateUsernameTextField()
        
        switch validation {
            case .correct:
                return (true, validation)
            default:
                return (false, validation)
        }
    }
    
    private func checkPasswordValidation() -> (Bool, ValidationCases) {
        let validation = validatePasswordTextField()
        
        switch validation {
            case .correct:
                return (true, validation)
            default:
                return (false, validation)
        }
    }
    
    private func checkRepeatPasswordValidation() -> (Bool, ValidationCases) {
        let validation = validateRepeatPasswordTextField()
        
        switch validation {
            case .correct:
                return (true, validation)
            default:
                return (false, validation)
        }
    }
    
    private func unfocusAllTextFields() {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repeatPasswordTextField.resignFirstResponder()
    }
    
    private func clearErrorLabels() {
        usernameErrorLabel.text = ""
        passwordErrorLabel.text = ""
        repeatPasswordErrorLabel.text = ""
    }
    
    private func createAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Congratulation!", message: "You have successfully completed registration", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(okAction)
        
        return alert
    }
}

extension RegistrationViewController: ValidationManager {
    func validateUsernameTextField() -> ValidationCases {
        guard let text = usernameTextField.text else { return ValidationCases.isEmpty }
        
        if text.isEmpty {
            return ValidationCases.isEmpty
        } else if text.count < 4 {
            return ValidationCases.incorrectLength
        } else if regex.firstMatch(in: text, range: .init(location: 0, length: text.count)) == nil {
            return ValidationCases.incorrectValue
        }
        return ValidationCases.correct
    }
    
    func validatePasswordTextField() -> ValidationCases {
        guard let text = passwordTextField.text else { return ValidationCases.isEmpty }
        
        if text.isEmpty {
            return ValidationCases.isEmpty
        } else if text.count < 4 {
            return ValidationCases.incorrectLength
        } else if regex.firstMatch(in: text, range: .init(location: 0, length: text.count)) == nil {
            return ValidationCases.incorrectValue
        }
        return ValidationCases.correct
    }
    
    func validateRepeatPasswordTextField() -> ValidationCases {
        guard let password = passwordTextField.text else { return ValidationCases.isEmpty }
        let repeatPassword = repeatPasswordTextField.text ?? ""
        
        if password.isEmpty {
            return ValidationCases.isEmpty
        } else if password.count < 4 {
            return ValidationCases.incorrectLength
        } else if regex.firstMatch(in: password, range: .init(location: 0, length: password.count)) == nil {
            return ValidationCases.incorrectValue
        } else if password != repeatPassword {
            return ValidationCases.differentPasswords
        }
        return ValidationCases.correct
    }
    
    
}
