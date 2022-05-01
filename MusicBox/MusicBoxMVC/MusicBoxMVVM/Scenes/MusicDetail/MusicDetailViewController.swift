//
//  MusicDetailViewController.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 22.10.2021.
//

import UIKit

final class MusicDetailViewController: UIViewController {
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var viewModel: MusicDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

extension MusicDetailViewController: MusicDetailViewModelDelegate {
    
    func showDetail(_ presentation: MusicDetailPresentation) {
        musicTitleLabel.text = presentation.title
        artistNameLabel.text = presentation.artistName
        genreLabel.text = presentation.genre
    }
}
