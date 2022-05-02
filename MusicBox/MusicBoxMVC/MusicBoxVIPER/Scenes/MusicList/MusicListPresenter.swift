//
//  MusicListPresenter.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation

final class MusicListPresenter: MusicListPresenterProtocol {
    
    private unowned let view: MusicListViewProtocol
    private let interactor: MusicListInteractorProtocol
    private let router: MusicListRouterProtocol
    
    init(view: MusicListViewProtocol, interactor: MusicListInteractorProtocol, router: MusicListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegate = self
    }
    
    func load() {
        view.handleOutput(.updateTitle("Musics"))
        interactor.load()
    }
    
    func selectMusic(at index: Int) {
        interactor.selectMusic(at: index)
    }
}

// MARK: - MusicListInteractorDelegate
extension MusicListPresenter: MusicListInteractorDelegate {
    func handleOutput(_ output: MusicListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showMusicList(let musics):
            let musicPresentations = musics.map(MusicPresentation.init)
            view.handleOutput(.showMusicList(musicPresentations))
        case .showMusicDetail(let music):
            router.navigate(to: .detail(music))
        }
    }
}
