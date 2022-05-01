//
//  MusicListBuilder.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 23.10.2021.
//

import UIKit

final class MusicListBuilder {
    
    static func make() -> MusicListViewController {
        let storyboard = UIStoryboard(name: "MusicList", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicListViewController") as! MusicListViewController
        viewController.viewModel = MusicListViewModel(service: app.service)
        return viewController
    }
}

