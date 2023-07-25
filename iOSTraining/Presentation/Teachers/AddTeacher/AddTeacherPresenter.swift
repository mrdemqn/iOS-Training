//
//  AddTeacherPresenter.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation

protocol AddTeacherPresenterProtocol {
    func saveTeacher(name: String,
                     lastName: String,
                     _ completion: @escaping () -> Void)
}

final class AddTeacherPresenter: AddTeacherPresenterProtocol {
    
    private let storageService = StorageService.shared
    
    func saveTeacher(name: String,
                     lastName: String,
                     _ completion: @escaping () -> Void) {
        storageService.save(Teacher.self) { context in
            let newTeacher = Teacher(context: context)
            newTeacher.name = name
            newTeacher.lastName = lastName
        } completion: {
            completion()
        }
    }
}
