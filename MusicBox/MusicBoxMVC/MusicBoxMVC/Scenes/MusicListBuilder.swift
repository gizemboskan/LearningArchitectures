//
//  MusicListBuilder.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit

final class MusicListBuilder{
    
    static func make() -> MusicListViewController {
        let storyboard = UIStoryboard(name: "MusicList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicListViewController") as! MusicListViewController
        viewController.service = app.service
        return viewController
    }
}
