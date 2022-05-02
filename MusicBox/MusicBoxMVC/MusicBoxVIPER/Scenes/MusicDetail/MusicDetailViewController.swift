//
//  MusicDetailViewController.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import UIKit

final class MusicDetailViewController: UIViewController, MusicDetailViewProtocol {
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var presenter: MusicDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ presentation: MusicDetailPresentation) {
        musicTitleLabel.text = presentation.title
        artistNameLabel.text = presentation.artistName
        genreLabel.text = presentation.genre
    }
}
