//
//  MusicPresentation.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

final class MusicPresentation: NSObject {
    
    let title: String
    let detail: String
    
    init(title: String, detail: String){
        self.title = title
        self.detail = detail
        super.init()
    }
}

extension MusicPresentation {
    
    convenience init(music: Music) {
        self.init(title: music.name, detail: music.artistName)
    }
}
