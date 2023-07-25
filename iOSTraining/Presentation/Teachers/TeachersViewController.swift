//
//  TeachersViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

import UIKit

final class TeachersViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: TeachersPresenterProtocol = TeachersPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupXibs()
        
        presenter.viewController = self
        presenter.fetchTeachers()
    }
}

extension TeachersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierKeys.teacherCell, for: indexPath) as? TeacherTableViewCell else { return UITableViewCell() }
        let teacher = presenter.teachers[indexPath.item]
        let title = teacher.convertTitle()
        cell.teacherLabel.attributedText = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teacher = presenter.teachers[indexPath.item]
        let viewController = getViewController(TeacherDetailsViewController.self,
                                               NavigationKeys.teacherDetailsScreen)
        viewController.teacher = teacher
        push(viewController)
    }
}

extension TeachersViewController {
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeacher))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupXibs() {
        let nib = UINib(nibName: "\(TeacherTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: IdentifierKeys.teacherCell)
    }
    
    private func updateTeachersList() {
        presenter.fetchTeachers()
    }
    
    @objc private func addTeacher() {
        let viewController = getViewController(AddTeacherViewController.self,
                                 NavigationKeys.addTeacherScreen)
        viewController.reloadCompletion = updateTeachersList
        push(viewController)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
