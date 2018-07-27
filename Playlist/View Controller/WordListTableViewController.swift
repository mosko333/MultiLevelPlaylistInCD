//
//  SongListTableViewController.swift
//  Playlist
//
//  Created by Adam on 09/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class WordListTableViewController: UITableViewController {
    
    
    @IBOutlet weak var wordNameTextField: UITextField!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addWordButtonTapped(_ sender: Any) {
        
        // the text is what the user is entering for our properties and it's adding to a playlist ("the parent object")
        guard let wordName = wordNameTextField.text, !wordName.isEmpty,
            let unwrappedSong = song else {return}
        
        WordController.createWordWith(name: wordName, to: unwrappedSong)
        wordNameTextField.text = ""
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let words = song?.words else { return 0}
        
        
        return words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        
        // We access our instance of one playlist, to count the songs and get one song for each row
        // We want to make sure it is a Word coming from coreData
        
        guard let word = song?.words?.object(at: indexPath.row) as? Word else { return UITableViewCell() }
        
        cell.textLabel?.text = word.name
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let unwrappedSong = song,
                let word = song?.words?.object(at: indexPath.row) as? Word else { return }
            
            WordController.delete(word: word, fromA: unwrappedSong)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //1) check the identifier of the segue
        if segue.identifier == "toWordDetailVC" {
            
            //2) Get the destination of where you want to go
            if let destinationVC = segue.destination as? WordDetailViewController {
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    //let playlist = PlaylistController.sharedController.playlists[indexPath.row]
                    let word = self.song?.words?[indexPath.row] as? Word
                    
                    destinationVC.word = word
                }
            }
        }
    }
}


