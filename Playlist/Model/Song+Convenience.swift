//
//  Song+Convenience.swift
//  Playlist
//
//  Created by Adam on 16/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

import CoreData

// We are adding on the class ("Entity") song

extension Song {
    convenience init(name: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {

        // initalizing the context for us to place our data into
        self.init(context: context)
        self.name = name
        self.artist = artist
        self.playlist = playlist
    }
}
