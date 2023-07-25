//
//  StudentDetailsViewController.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import UIKit

final class StudentDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    
    var model: StudentDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(model)
    }
    
    private func configure(_ model: StudentDetailsViewModel?) {
        nameLabel.attributedText = model?.name
        ageLabel.attributedText = model?.age
        teacherLabel.attributedText = model?.teacher
    }
}

struct StudentDetailsViewModel {
    let name: NSAttributedString
    let age: NSAttributedString
    let teacher: NSAttributedString?
    
    init() {
        self.name = NSAttributedString(string: "")
        self.age = NSAttributedString(string: "")
        self.teacher = nil
    }
    
    init(name: NSAttributedString,
         age: NSAttributedString) {
        self.name = name
        self.age = age
        self.teacher = nil
    }
    
    init(name: NSAttributedString,
         age: NSAttributedString,
         teacher: NSAttributedString) {
        self.name = name
        self.age = age
        self.teacher = teacher
    }
}
