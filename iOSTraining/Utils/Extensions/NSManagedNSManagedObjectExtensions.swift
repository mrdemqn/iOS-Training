//
//  NSManagedNSManagedObjectExtensions.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    @nonobjc public class func fetchTypedRequest<T: NSManagedObject>(_ type: T.Type) -> NSFetchRequest<T> {
        return NSFetchRequest<T>(entityName: String(describing: type))
    }
}
