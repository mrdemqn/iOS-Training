//
//  StudentsPresenter.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation

protocol StudentsPresenterProtocol {
    
    var viewController: StudentsViewController? { get set }
    
    var students: [Student] { get }
    
    func fetchStudents()
}

final class StudentsPresenter: StudentsPresenterProtocol {
    
    weak var viewController: StudentsViewController?
    
    private let storageService = StorageService.shared
    
    var students: [Student] = [] {
        didSet {
            viewController?.reloadTableView()
        }
    }
    
    func fetchStudents() {
        let students = storageService.fetch(Student.self)
        self.students = students
    }
}
