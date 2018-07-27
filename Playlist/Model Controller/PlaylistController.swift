//
//  PlaylistController.swift
//  Playlist
//
//  Created by Adam on 09/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {

    // steps to think of when making model controller
    // 1) CRUD
    // 2) SOURCE OF TRUTH
    // 3) SharedInstance

    // this is our shared instance to get everything inside this class
    static let sharedController = PlaylistController()

    /// This is our source of TRUTH!!!
    var playlists: [Playlist] {

        // we define out request of what we would like to get back. then we tell it to perform that request
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        // WE ALLWAYS NEED TO talk to our context first, in order to get what object we want out of it
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }

    init() {

    }

    //C
    func create(playlistName: String) {

        // 1) create an instance "Think initalizer"
        Playlist(name: playlistName)
        CoreDataStack.save()
    }


    //R

    //U
    func update(playlist: Playlist, newName: String) {
        playlist.name = newName
        CoreDataStack.save()
    }

    //D
    func delete(playlist: Playlist) {

        CoreDataStack.context.delete(playlist)

        CoreDataStack.save()
    }
}
