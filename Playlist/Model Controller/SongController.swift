//
//  SongController.swift
//  Playlist
//
//  Created by Adam on 09/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

class SongController {

    // This is a static method that belongs to the class so we do not need an instance
    static func createSongWith(artist: String, name: String, to playlist: Playlist) {
        let _ = Song(name: name, artist: artist, playlist: playlist)
        CoreDataStack.save()
    }

    static func delete(song: Song, fromA playlist: Playlist) {
        CoreDataStack.context.delete(song)
        CoreDataStack.save()
    }

}
