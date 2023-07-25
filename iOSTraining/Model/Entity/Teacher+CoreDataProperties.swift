//
//  Teacher+CoreDataProperties.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//
//

import Foundation
import CoreData
import UIKit

extension Teacher {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }
    
    @NSManaged public var lastName: String?
    @NSManaged public var name: String?
    @NSManaged public var students: NSSet?
    
}

// MARK: Generated accessors for students
extension Teacher {
    
    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)
    
    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)
    
    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)
    
    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)
    
}

extension Teacher : Identifiable {
    
    func convertTitle() -> NSAttributedString {
        guard let name = self.name,
              let lastName = self.lastName else { return NSAttributedString(string: " ") }
        
        let attributedName = NSAttributedString(string: name,
                                                attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)])
        let attributedLastName = NSAttributedString(string: lastName,
                                                    attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .bold)])
        
        let title = NSMutableAttributedString(attributedString: attributedName)
        title.append(NSAttributedString(string: " "))
        title.append(attributedLastName)
        
        return title
    }
    
    func convertNameLastNameLabels() -> NameLastNameLabels {
        let empty = NSAttributedString(string: " ")
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        let regularAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]
        
        guard let name = self.name,
              let lastName = self.lastName else { return (empty, empty) }
        
        let attributedName = NSAttributedString(string: name,
                                                attributes: boldAttributes)
        let attributedLastName = NSAttributedString(string: lastName,
                                                    attributes: boldAttributes)
        
        let nameLabel = NSMutableAttributedString(string: "Name: ",
                                                  attributes: regularAttributes)
        nameLabel.append(attributedName)
        
        let lastNameLabel = NSMutableAttributedString(string: "LastName: ",
                                                      attributes: regularAttributes)
        lastNameLabel.append(attributedLastName)
        
        return (nameLabel, lastNameLabel)
    }
}

typealias NameLastNameLabels = (name: NSAttributedString, lastName: NSAttributedString)
