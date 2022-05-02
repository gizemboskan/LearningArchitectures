//
//  MusicListRouter.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import UIKit

final class MusicListRouter: MusicListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MusicListRoute) {
        switch route {
        case .detail(let music):
            let detailView = MusicDetailBuilder.make(with: music)
            view.show(detailView, sender: nil)
        }
    }
}
