//
//  ValidationManager.swift
//  iOSTraining
//
//  Created by Димон on 19.06.23.
//

protocol ValidationManager {
    func validateUsernameTextField() -> ValidationCases
    func validatePasswordTextField() -> ValidationCases
    func validateRepeatPasswordTextField() -> ValidationCases
}

enum ValidationCases: String {
    case isEmpty = "This field cannot be empty"
    case incorrectLength = "Please enter at least 4 characters"
    case incorrectValue = "Please enter one capital letter, one small letter, one number and one symbol"
    case differentPasswords = "Passwords must match"
    case correct = ""
}
