//
//  MusicDetailView.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import UIKit

final class MusicDetailView: UIView {
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
}

extension MusicDetailView: MusicDetailViewProtocol {
  
    func updateMusicDetail(_ musicDetail: MusicDetailPresentation) {
        musicTitleLabel.text = musicDetail.title
        artistNameLabel.text = musicDetail.artistName
        genreLabel.text = musicDetail.genre
    }
    
    

        
   
}
