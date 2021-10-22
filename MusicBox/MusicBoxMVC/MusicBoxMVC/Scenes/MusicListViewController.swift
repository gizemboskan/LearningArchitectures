//
//  MusicListViewController.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit
import MusicBoxAPI

final class MusicListViewController: UIViewController {
    
    @IBOutlet weak var customView: MusicListViewProtocol! {
        didSet {
            customView.delegate = self 
        }
    }
    
    var service: TopMusicsServiceProtocol!
    private var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Musics"
        
        customView.setLoading(true)
        
        service.fetchTopMusics { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                self.musicList = value.results
                let musicPresentations = value.results.map(MusicPresentation.init)
                self.customView.updateMusicList(musicPresentations)
            case.failure(let error):
                print(error)
            }
            self.customView.setLoading(false)
        }
    }
    
}

extension MusicListViewController: MusicListViewDelegate {
    func didSelectMusic(at index: Int) {
        let music = musicList[index]
        let musicDetailViewController = MusicDetailBuilder.make(with: music)
        show(musicDetailViewController, sender: nil)
    }
}
