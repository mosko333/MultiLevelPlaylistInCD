//
//  SongListTableViewController.swift
//  Playlist
//
//  Created by Adam on 09/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!

    var playlist: Playlist?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addSongButtonTapped(_ sender: Any) {

        // the text is what the user is entering for our properties and it's adding to a playlist ("the parent object")
        guard let artist = artistTextField.text, !artist.isEmpty,
            let name = songNameTextField.text, !name.isEmpty,
            let UnwrappedPlaylist = playlist else {return}

        SongController.createSongWith(artist: artist, name: name, to: UnwrappedPlaylist)
        artistTextField.text = ""
        songNameTextField.text = ""
        tableView.reloadData()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let songs = playlist?.songs else { return 0}

        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        // We access our instance of one playlist, to count the songs and get one song for each row
        // We want to make sure it is a Song coming from coreData
        guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return UITableViewCell() }

        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            guard let unwrappedPlaylist = playlist,
                let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return }

            SongController.delete(song: song, fromA: unwrappedPlaylist)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //1) check the identifier of the segue
        if segue.identifier == "toWordsVC" {
            
            //2) Get the destination of where you want to go
            if let destinationVC = segue.destination as? WordListTableViewController {
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    //let playlist = PlaylistController.sharedController.playlists[indexPath.row]
                    let song = self.playlist?.songs?[indexPath.row] as? Song
                    
                    destinationVC.song = song
                }
            }
        }
    }
}

