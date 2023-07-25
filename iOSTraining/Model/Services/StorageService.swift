//
//  StorageService.swift
//  iOSTraining
//
//  Created by Димон on 24.07.23.
//

import Foundation
import CoreData

protocol StorageServiceProtocol {
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T]
    
    func save<T: NSManagedObject>(_ entity: T.Type,
                                  _ createEntityClosure: @escaping (NSManagedObjectContext) -> Void,
                                  completion: @escaping () -> Void)
}

final class StorageService: StorageServiceProtocol {
    
    static let shared: StorageServiceProtocol = StorageService()
    
    private var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SchoolModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let error = error as NSError
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func save<T: NSManagedObject>(_ entity: T.Type,
                                  _ createEntityClosure: @escaping (NSManagedObjectContext) -> Void,
                                  completion: @escaping () -> Void) {
        context.perform { [self] in
            createEntityClosure(context)
            saveContext()
            completion()
        }
    }
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T] {
        let fetchRequest: NSFetchRequest<T> = T.fetchTypedRequest(type)
        do {
            let objects = try context.fetch(fetchRequest)
            return objects
        } catch {
            let error = error as NSError
            print("Fetch Error: \(error.userInfo)")
            return []
        }
    }
}
