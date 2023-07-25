//
//  TeachersDetailsViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

final class TeacherDetailsViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var lastNameLabel: UILabel!
    
    @IBOutlet private weak var tableView: UITableView!
    
    var teacher: Teacher?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupXibs()
        
        setupLabels()
    }
}

extension TeacherDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let students = teacher?.students?.allObjects as? [Student] else { return 0 }
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierKeys.studentCell,
                                                       for: indexPath) as? StudentTableViewCell,
              let students = teacher?.students?.allObjects as? [Student] else { return UITableViewCell() }
        
        let student = students[indexPath.item]
        let title = student.convertTitle(nameFontWeight: .bold,
                                         ageFontWeight: .regular)
        cell.nameLabel.attributedText = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let students = teacher?.students?.allObjects as? [Student] else { return }
        let student = students[indexPath.item]
        let viewController = getViewController(StudentDetailsViewController.self,
                                               NavigationKeys.studentDetailsScreen)
        let model = student.makeViewModel()
        viewController.model = model
        push(viewController)
    }
}

extension TeacherDetailsViewController {
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupXibs() {
        let nib = UINib(nibName: "\(StudentTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: IdentifierKeys.studentCell)
    }
    
    private func setupLabels() {
        guard let labels = teacher?.convertNameLastNameLabels() else { return }
        
        nameLabel.attributedText = labels.name
        lastNameLabel.attributedText = labels.lastName
    }
}
