//
//  MusicDetailBuilder.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 22.10.2021.
//

import UIKit
import MusicBoxAPI

final class MusicDetailBuilder {
    
    static func make(with viewModel: MusicDetailViewModelProtocol) ->
    MusicDetailViewController {
        let storyboard = UIStoryboard(name: "MusicDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MusicDetailViewController") as! MusicDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
