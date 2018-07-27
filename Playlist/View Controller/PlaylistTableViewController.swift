//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Adam on 09/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    @IBOutlet weak var playlistTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        // First do apple code
        super.viewWillAppear(animated)
        // Then do your code
        tableView.reloadData()
    }
    // MARK: Action

    @IBAction func addPlaylistButtonTapped(_ sender: UIBarButtonItem) {

        guard let playlistName = playlistTextField.text, !playlistName.isEmpty else { return }

        PlaylistController.sharedController.create(playlistName: playlistName)
        playlistTextField.text = "" //This clears the text of the text field
        tableView.reloadData() // run the two required methods again
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedController.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)

        let playlist = PlaylistController.sharedController.playlists[indexPath.row]

        guard let songs = playlist.songs else { return UITableViewCell() }

        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(songs.count)"

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let playlist = PlaylistController.sharedController.playlists[indexPath.row]

            PlaylistController.sharedController.delete(playlist: playlist)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //1) check the identifier of the segue
        if segue.identifier == "toSongDetailVC" {

            //2) Get the destination of where you want to go
            if let destinationVC = segue.destination as? SongListTableViewController {

                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let playlist = PlaylistController.sharedController.playlists[indexPath.row]

                        destinationVC.playlist = playlist
                }
            }
        }
    }

}
