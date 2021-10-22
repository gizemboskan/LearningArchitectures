//
//  MusicListContracts.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

protocol MusicListViewModelProtocol {
    func load()
    func selectMoviePath(at index: Int)
    var delegate: MusicListViewModelDelegate? {get set}
    
}

enum MusicListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MusicPresentation])
}

protocol MusicListViewModelDelegate {
    func handleViewModelOuput(_ output: MusicListViewModelOutput)
}

