//
//  AddStudentPresenter.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation

protocol AddStudentPresenterProtocol {
    var viewController: AddStudentViewController? { get set }
    
    var teacher: Teacher? { get }
    
    func saveStudent(name: String,
                     age: String,
                     teacher: Teacher?,
                     _ completion: @escaping () -> Void)
    
    func saveChosenTeacher(_ teacher: Teacher)
}

final class AddStudentPresenter: AddStudentPresenterProtocol {
    
    private let storageService = StorageService.shared
    
    weak var viewController: AddStudentViewController?
    
    var teacher: Teacher? {
        didSet {
            viewController?.changeButton()
        }
    }
    
    func saveStudent(name: String,
                     age: String,
                     teacher: Teacher?,
                     _ completion: @escaping () -> Void) {
        storageService.save(Student.self) { context in
            let newStudent = Student(context: context)
            newStudent.name = name
            newStudent.age = age
            newStudent.teacher = teacher
        } completion: {
            completion()
        }
    }
    
    func saveChosenTeacher(_ teacher: Teacher) {
        self.teacher = teacher
    }
}
