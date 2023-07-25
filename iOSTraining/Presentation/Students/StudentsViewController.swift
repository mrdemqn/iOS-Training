//
//  StudentsViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

final class StudentsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter: StudentsPresenterProtocol = StudentsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupXibs()
        
        presenter.viewController = self
        presenter.fetchStudents()
    }
}

extension StudentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierKeys.studentCell, for: indexPath) as? StudentTableViewCell else { return UITableViewCell() }
        let student = presenter.students[indexPath.item]
        let title = student.convertTitle()
        cell.nameLabel.attributedText = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = presenter.students[indexPath.item]
        let viewController = getViewController(StudentDetailsViewController.self,
                          NavigationKeys.studentDetailsScreen)
        let model = student.makeViewModel()
        viewController.model = model
        push(viewController)
    }
}

extension StudentsViewController {
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStudent))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupXibs() {
        let nib = UINib(nibName: "\(StudentTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: IdentifierKeys.studentCell)
    }
    
    private func updateStudentsList() {
        presenter.fetchStudents()
    }
    
    @objc private func addStudent() {
        let viewController = getViewController(AddStudentViewController.self,
                                 NavigationKeys.addStudentScreen)
        viewController.reloadCompletion = updateStudentsList
        push(viewController)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
