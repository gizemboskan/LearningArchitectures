//
//  MusicDetailContracts.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation

protocol MusicDetailViewModelDelegate: AnyObject {
    func showDetail(_ musicDetail: MusicDetailPresentation)
}

protocol MusicDetailViewModelProtocol {
    var delegate: MusicDetailViewModelDelegate? { get set }
    func load()
}
