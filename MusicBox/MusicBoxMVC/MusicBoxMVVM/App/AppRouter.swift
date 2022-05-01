//
//  AppRouter.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit

final class AppRouter {
    
    func start(window: UIWindow) {
        
        let viewController = MusicListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
