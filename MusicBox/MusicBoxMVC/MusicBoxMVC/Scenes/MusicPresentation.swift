//
//  MusicPresentation.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

struct MusicPresentation {
    
    let title: String
    let detail: String
}

extension MusicPresentation {
    
    init(music: Music) {
        self.init(title: music.name, detail: music.artistName)
    }
}
