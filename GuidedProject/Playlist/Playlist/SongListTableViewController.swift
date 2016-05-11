//
//  SongListTableViewController.swift
//  Playlist
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let unwrappedPlaylist = playlist {
            self.title = unwrappedPlaylist.name
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        if let title = titleTextField.text, let artist = artistTextField.text, let playlist = playlist {
            SongController.createSong(title, artist: artist, playlist: playlist)
            tableView.reloadData()
            titleTextField.text = ""
            artistTextField.text = ""
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songCell", forIndexPath: indexPath)

        let song = playlist?.songs[indexPath.row]
        
        cell.textLabel?.text = song?.title
        cell.detailTextLabel?.text = song?.artist

        return cell
    }

}
