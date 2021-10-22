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
    
    init(service: TopMusicsServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Musics"))
        notify(.setLoading(true))
        
        service.fetchTopMusics { [weak self] (result) in
            guard let strongSelf = self else { return }
            strongSelf.notify(.setLoading(false))
            switch result {
            case .success(let response):
                let musics = response.results
                let presentations = musics.map({ MusicPresentation(music: $0) })
                strongSelf.notify(.showMovieList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMoviePath(at index: Int) {
        
    }
    
    private func notify(_ output: MusicListViewModelOutput) {
        delegate?.handleViewModelOuput(output)
    }
    
}
