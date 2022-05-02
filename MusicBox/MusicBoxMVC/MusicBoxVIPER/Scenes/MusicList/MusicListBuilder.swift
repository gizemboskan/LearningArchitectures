//
//  MusicListBuilder.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import UIKit

final class MusicListBuilder {
    
    static func make() -> MusicListViewController {
        let storyboard = UIStoryboard(name: "MusicList", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "MusicListViewController") as! MusicListViewController
        let router = MusicListRouter(view: view)
        let interactor = MusicListInteractor(service: app.service)
        let presenter = MusicListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        return view
    }
}
