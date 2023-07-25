//
//  TeachersPresenter.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation

protocol TeachersPresenterProtocol {
    
    var viewController: TeachersViewController? { get set }
    
    var teachers: [Teacher] { get }
    
    func fetchTeachers()
}

final class TeachersPresenter: TeachersPresenterProtocol {
    
    weak var viewController: TeachersViewController?
    
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
