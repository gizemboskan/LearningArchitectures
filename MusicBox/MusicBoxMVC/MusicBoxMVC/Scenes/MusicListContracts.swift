//
//  MusicListContracts.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

protocol MusicListViewProtocol {
    var delegate: MusicListViewDelegate? {get set}
    func updateMusicList(_ musicList: [MusicPresentation])
    func setLoading(_ isLoading: Bool)
}

@objc protocol MusicListViewDelegate: AnyObject {
    func didSelectMusic(at index: Int)
}

