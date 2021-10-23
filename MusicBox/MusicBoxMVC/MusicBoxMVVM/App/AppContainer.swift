//
//  AppContainer.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

public let app = AppContainer()

public final class AppContainer {
    
    let router = AppRouter()
    let service = TopMusicsService() 
}

