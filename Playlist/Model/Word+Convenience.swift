//
//  Word+Convenience.swift
//  Playlist
//
//  Created by Adam on 25/07/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

import CoreData

// We are adding on the class ("Entity") song

extension Word {
    convenience init(name: String, song: Song, context: NSManagedObjectContext = CoreDataStack.context) {
        
        // initalizing the context for us to place our data into
        self.init(context: context)
        self.name = name
        self.song = song
    }
}
