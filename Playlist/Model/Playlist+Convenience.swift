//
//  Playlist+Convenience.swift
//  Playlist
//
//  Created by Adam on 16/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation
import CoreData

// This is adding on to our playlist Entity
extension Playlist {

    // Giving us the ability to add on to our exisiting initializer
    // This is going to be out scratch pad or paper where we can write our objects down
    // give context a default value so it's not an optional
    @discardableResult convenience init(name: String, insertInto context: NSManagedObjectContext = CoreDataStack.context) {

        // We just init our scratch pad
        self.init(context: context)
        self.name = name
    }
}
