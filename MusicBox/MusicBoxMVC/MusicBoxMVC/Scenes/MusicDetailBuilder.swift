//
//  MusicDetailBuilder.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import UIKit
import MusicBoxAPI

public final class MusicDetailBuilder {
    
    static func make(with music: Music) ->
    MusicDetailViewController {
        let storyboard = UIStoryboard(name: "MusicDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicDetailViewController") as! MusicDetailViewController
        viewController.music = music
        return viewController
    }
}
