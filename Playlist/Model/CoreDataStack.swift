//
//  CoreDataStack.swift
//  Playlist
//
//  Created by Adam on 16/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

import CoreData

struct CoreDataStack {

    static let container: NSPersistentContainer = {

        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    static func save() {
        do {
            try CoreDataStack.context.save()
        } catch let error {
            print("Error saving to persistant data \(#function) \(error) \(error.localizedDescription)")
        }
    }
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
