//
//  MusicDetailViewModel.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 23.10.2021.
//

import Foundation
import MusicBoxAPI

final class MusicDetailViewModel: MusicDetailViewModelProtocol{
    
    var delegate: MusicDetailViewModelDelegate?
    private let presentation: MusicDetailPresentation
    
    init(music: Music) {
        self.presentation = MusicDetailPresentation(music: music)
    }
    func load() {
        delegate?.showDetail(presentation)
    }
}
