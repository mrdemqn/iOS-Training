//
//  TeachersPresenter.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation

protocol ChooseTeachersPresenterProtocol {
    
    var viewController: ChooseTeacherViewController? { get set }
    
    var teachers: [Teacher] { get }
    
    func fetchTeachers()
}

final class ChooseTeachersPresenter: ChooseTeachersPresenterProtocol {
    
    weak var viewController: ChooseTeacherViewController?
    
    private let storageService = StorageService.shared
    
    var teachers: [Teacher] = [] {
        didSet {
            viewController?.reloadTableView()
        }
    }
    
    func fetchTeachers() {
        let teachers = storageService.fetch(Teacher.self)
        self.teachers = teachers
    }
}
