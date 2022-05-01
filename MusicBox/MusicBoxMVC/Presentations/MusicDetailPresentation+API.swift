//
//  MusicDetailPresentation+API.swift
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

extension MusicDetailPresentation {
    init(music: Music) {
        self.init(title: music.name,
                  artistName: music.artistName,
                  genre: music.genres.map({ $0.name.rawValue}).joined(separator: ", "))
    }
}
