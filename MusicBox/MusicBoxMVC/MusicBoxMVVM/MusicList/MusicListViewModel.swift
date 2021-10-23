//
//  MusicListViewModel.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation
import MusicBoxAPI

final class MusicListViewModel: MusicListViewModelProtocol {
    
    var delegate: MusicListViewModelDelegate?
    private let service: TopMusicsServiceProtocol
    private var musics: [Music] = []
    
    init(service: TopMusicsServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Musics"))
        notify(.setLoading(true))
        
        service.fetchTopMusics { [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            switch result {
            case .success(let response):
                let musics = response.results
                let presentations = musics.map({ MusicPresentation(music: $0) })
                self.notify(.showMusicList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMusicPath(at index: Int) {
        let music = musics[index]
        let viewModel = MusicDetailViewModel(music: music)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MusicListViewModelOutput) {
        delegate?.handleViewModelOuput(output)
    }
    
}
