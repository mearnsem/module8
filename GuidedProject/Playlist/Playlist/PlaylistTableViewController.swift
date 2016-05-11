//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    @IBOutlet weak var playlistNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let playlistName = playlistNameTextField.text where playlistName.characters.count > 0 {
            PlaylistController.sharedInstance.addPlaylist(playlistName)
            tableView.reloadData()
            playlistNameTextField.text = ""
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.sharedInstance.playlists.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("playlistCell", forIndexPath: indexPath)

        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count) songs"

        return cell
    }


    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSongList", let songListTVC = segue.destinationViewController as? SongListTableViewController, let playlistCell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(playlistCell) {
            songListTVC.playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        }
    }
    

}







