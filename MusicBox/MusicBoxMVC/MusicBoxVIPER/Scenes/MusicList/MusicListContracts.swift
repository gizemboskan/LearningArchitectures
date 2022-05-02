//
//  MusicListContracts.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation
import struct MusicBoxAPI.Music

// MARK: - Interactor
protocol MusicListInteractorProtocol: AnyObject {
    var delegate: MusicListInteractorDelegate? { get set }
    func load()
    func selectMusic(at index: Int)
}

enum MusicListInteractorOutput: Equatable {
    case setLoading(Bool)
    case showMusicList([Music])
    case showMusicDetail(Music)
}

protocol MusicListInteractorDelegate: AnyObject {
    func handleOutput(_ output: MusicListInteractorOutput)
}

// MARK: - Presenter
protocol MusicListPresenterProtocol: AnyObject {
    func load()
    func selectMusic(at index: Int)
}

enum MusicListPresenterOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showMusicList([MusicPresentation])
}

// MARK: - View
protocol MusicListViewProtocol: AnyObject {
    func handleOutput(_ output: MusicListPresenterOutput)
}

// MARK: - Router
enum MusicListRoute: Equatable {
    case detail(Music)
}

protocol MusicListRouterProtocol: AnyObject {
    func navigate(to route: MusicListRoute)
}
