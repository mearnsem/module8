//
//  Playlist.swift
//  Playlist
//
//  Created by Emily Mearns on 5/11/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Playlist: Equatable {
    
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}

