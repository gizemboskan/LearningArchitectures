//
//  AppContainer.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import MusicBoxAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = TopMusicsService() 
}

