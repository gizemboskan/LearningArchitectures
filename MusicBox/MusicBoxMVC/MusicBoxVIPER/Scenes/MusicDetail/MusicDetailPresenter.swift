//
//  MusicDetailPresenter.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation
import struct MusicBoxAPI.Music

final class MusicDetailPresenter: MusicDetailPresenterProtocol {
    
    unowned let view: MusicDetailViewProtocol
    private let music: Music
    
    init(view: MusicDetailViewProtocol, music: Music) {
        self.view = view
        self.music = music
    }
    
    func load() {
        view.update(MusicDetailPresentation(music: music))
    }
}
