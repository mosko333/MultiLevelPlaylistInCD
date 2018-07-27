//
//  WordController.swift
//  Playlist
//
//  Created by Adam on 25/07/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation
import UIKit

class WordController {
    
//     This is a static method that belongs to the class so we do not need an instance
    static func createWordWith(name: String, to song: Song) {
        let _ = Word(name: name, song: song)
        CoreDataStack.save()
    }
    
    static func addImage(with image: UIImage, to word: Word) {
        let imageData = UIImageJPEGRepresentation(image, 1)
        word.image = imageData
        CoreDataStack.save()
    }
    
    static func delete(word: Word, fromA song: Song) {
        CoreDataStack.context.delete(word)
        CoreDataStack.save()
    }
    
}
