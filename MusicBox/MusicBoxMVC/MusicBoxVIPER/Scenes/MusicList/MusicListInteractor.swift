//
//  MusicListInteractor.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation
import MusicBoxAPI

final class MusicListInteractor: MusicListInteractorProtocol {
    
    weak var delegate: MusicListInteractorDelegate?
    
    private let service: TopMusicsServiceProtocol
    private var musics: [Music] = []
    
    init(service: TopMusicsServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchTopMusics { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            
            switch result {
            case .success(let value):
                self.musics = value.results
                self.delegate?.handleOutput(.showMusicList(value.results))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMusic(at index: Int) {
        let music = musics[index]
        delegate?.handleOutput(.showMusicDetail(music))
    }
}
