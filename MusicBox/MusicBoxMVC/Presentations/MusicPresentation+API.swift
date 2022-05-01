//
//  MusicPresentation+API.swift
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

extension MusicPresentation {
    convenience init(music: Music) {
        self.init(title: music.name, detail: music.artistName)
    }
}
