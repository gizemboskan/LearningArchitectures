//
//  MusicDetailViewController.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import UIKit
import MusicBoxAPI
final class MusicDetailViewController: UIViewController {
    
    @IBOutlet weak var customView: MusicDetailView!
    var music: Music!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.updateMusicDetail(MusicDetailPresentation(music: music))
    }
    
    
    
}
