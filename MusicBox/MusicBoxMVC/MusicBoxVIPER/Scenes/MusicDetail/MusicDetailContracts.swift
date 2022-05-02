//
//  MusicDetailContracts.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation

// MARK: - Presenter
protocol MusicDetailPresenterProtocol: AnyObject {
    func load()
}

// MARK: - View
protocol MusicDetailViewProtocol: AnyObject {
    func update(_ presentation: MusicDetailPresentation)
}
