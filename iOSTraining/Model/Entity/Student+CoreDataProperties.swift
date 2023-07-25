//
//  Student+CoreDataProperties.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//
//

import Foundation
import CoreData
import UIKit

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var age: String?
    @NSManaged public var name: String?
    @NSManaged public var teacher: Teacher?

}

extension Student : Identifiable {

    func convertTitle(nameFontWeight: UIFont.Weight = .regular,
                      ageFontWeight: UIFont.Weight = .bold) -> NSAttributedString {
        guard let name = self.name,
              let age = self.age else { return NSAttributedString(string: " ") }
        
        let attributedName = NSAttributedString(string: name,
                                                attributes: [.font: UIFont.systemFont(ofSize: 24,
                                                                                      weight: nameFontWeight)])
        let attributedAge = NSAttributedString(string: age,
                                               attributes: [.font: UIFont.systemFont(ofSize: 24,
                                                                                     weight: ageFontWeight)])
        
        let title = NSMutableAttributedString(attributedString: attributedName)
        title.append(NSAttributedString(string: " "))
        title.append(attributedAge)
        
        return title
    }
    
    func makeViewModel() -> StudentDetailsViewModel {
        var model = StudentDetailsViewModel()
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        
        guard let name = self.name,
              let age = self.age else { return model }
        
        let boldName = NSAttributedString(string: name,
                                             attributes: attributes)
        
        let boldAge = NSAttributedString(string: age,
                                             attributes: attributes)
        
        let attributedName = NSMutableAttributedString(string: "Name: ")
        attributedName.append(boldName)
        
        let attributedAge = NSMutableAttributedString(string: "Age: ")
        attributedAge.append(boldAge)
        
        model = StudentDetailsViewModel(name: attributedName,
                                            age: attributedAge)
        
        guard let teacher = self.teacher else { return model }
        
        let teacherName = teacher.convertTitle().string
        
        let boldTeacher = NSAttributedString(string: teacherName,
                                             attributes: attributes)
        
        let attributedTeacher = NSMutableAttributedString(string: "Teacher: ")
        attributedTeacher.append(boldTeacher)
        
        model = StudentDetailsViewModel(name: attributedName,
                                        age: attributedAge,
                                        teacher: attributedTeacher)
        
        return model
    }
}
