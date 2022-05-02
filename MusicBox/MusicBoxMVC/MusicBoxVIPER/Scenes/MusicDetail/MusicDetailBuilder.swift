//
//  MusicDetailBuilder.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import UIKit
import struct MusicBoxAPI.Music

final class MusicDetailBuilder {
    
    static func make(with music: Music) -> MusicDetailViewController{
        let storyboard = UIStoryboard(name: "MusicDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicDetailViewController") as! MusicDetailViewController
        let presenter = MusicDetailPresenter(view: viewController, music: music)
        viewController.presenter = presenter
        return viewController
    }
}
