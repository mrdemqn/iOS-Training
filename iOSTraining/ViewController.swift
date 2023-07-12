//
//  ViewController.swift
//  iOSTraining
//
//  Created by Димон on 14.06.23.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var personNames: [Character: [Person]] = [:] {
        didSet {
            if !tableView.isEditing {
                tableView.reloadData()
            }
        }
    }
    
    private var sections: [Character] = [] {
        didSet {
            sections.sort(by: <)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "\(PersonTableViewCell.self)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        let nibHeader = UINib(nibName: "\(TableViewHeader.self)", bundle: nil)
        tableView.register(nibHeader, forCellReuseIdentifier: "Header")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(routeCreateContactAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
    }
}

extension ViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sections[section]
        guard let count = personNames[key]?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewHeader = tableView.dequeueReusableCell(withIdentifier: "Header") as? TableViewHeader else { return nil }
        let header = sections[section]
        let viewModel = TableHeaderViewModel(title: header)
        viewHeader.configure(with: viewModel)
        
        return viewHeader
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteItem(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = sections[indexPath.section]
        guard let persons = personNames[key] else { return UITableViewCell() }
        let model = persons[indexPath.item]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonTableViewCell
        
        let viewModel = makeViewModel(from: model)
        cell.configure(viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension ViewController {
    
    func makeViewModel(from person: Person) -> PersonTableViewModel {
        let nameAttributedString = NSAttributedString(string: person.firstName, attributes: [.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)])
        let lastNameAttributedString = NSAttributedString(string: person.lastName, attributes: [.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)])
        let attributedString = NSMutableAttributedString(attributedString: nameAttributedString)
        attributedString.append(NSAttributedString(string: " "))
        attributedString.append(lastNameAttributedString)
        
        return PersonTableViewModel(title: attributedString)
    }
    
    @objc private func routeCreateContactAction() {
        if tableView.isEditing { editAction() }
        
        let storyboard = UIStoryboard(name: "CreateNewContactStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CreateNewContactViewController") as! CreateNewContactViewController
        viewController.saveCompletion = saveCompletion
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func editAction() {
        tableView.isEditing.toggle()
        
        if tableView.isEditing {
            navigationItem.leftBarButtonItem = createBarButton("Done")
        } else {
            navigationItem.leftBarButtonItem = createBarButton("Edit")
        }
    }
    
    private func createBarButton(_ title: String) -> UIBarButtonItem {
        return UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(editAction))
    }
    
    private func saveCompletion(person: Person) {
        guard let firstLetter = person.firstName.first?.description.uppercased() else { return }
        let char = Character(firstLetter)
        
        guard var existsPersons = personNames[char] else {
            sections.append(char)
            personNames.updateValue([person], forKey: char)
            return
        }
        
        existsPersons.append(person)
        personNames.updateValue(existsPersons, forKey: char)
    }
    
    private func deleteItem(_ indexPath: IndexPath) {
        tableView.beginUpdates()
        
        deleteRow(indexPath)
        deleteHeader(indexPath)
        
        tableView.endUpdates()
        
        tableView.reloadData()
    }
    
    private func deleteRow(_ indexPath: IndexPath) {
        let key = sections[indexPath.section]
        guard var persons = personNames[key] else { return }
        
        persons.remove(at: indexPath.item)
        if persons.isEmpty {
            personNames.removeValue(forKey: key)
        } else {
            personNames.updateValue(persons, forKey: key)
        }
        tableView.deleteRows(at: [indexPath], with: .bottom)
    }
    
    private func deleteHeader(_ indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [self] in
            let key = sections[indexPath.section]
            guard personNames[key] == nil else { return }
            
            sections.remove(at: indexPath.section)
            tableView.deleteSections([indexPath.section], with: .bottom)

            if personNames.isEmpty && sections.isEmpty {
                editAction()
            }
        }
    }
}

struct Person {
    let firstName: String
    let lastName: String
}
