//
//  MusicListContracts.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

protocol MusicListViewModelProtocol {
    
    var delegate: MusicListViewModelDelegate? {get set}
    func load()
    func selectMusicPath(at index: Int)
}

enum MusicListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMusicList([MusicPresentation])
}

enum MusicListViewRoute {
    case detail(MusicDetailViewModelProtocol)
}

protocol MusicListViewModelDelegate {
    func handleViewModelOuput(_ output: MusicListViewModelOutput)
    func navigate(to route: MusicListViewRoute)
}
