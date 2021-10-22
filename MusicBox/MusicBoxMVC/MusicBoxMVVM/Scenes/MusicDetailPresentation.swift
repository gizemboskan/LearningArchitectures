//
//  MusicDetailPresentation.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation
import MusicBoxAPI

struct MusicDetailPresentation {
    let title: String
    let artistName: String
    let genre: String
    
}


extension MusicDetailPresentation {
    
    init(music: Music) {
        self.init(title: music.name, artistName: music.artistName, genre: music.genres.map({ $0.name.rawValue}).joined(separator: ", "))
    }
}

