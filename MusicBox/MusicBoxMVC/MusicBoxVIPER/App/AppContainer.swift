//
//  AppContainer.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import Foundation
import MusicBoxAPI

public let app = AppContainer()

public final class AppContainer {
    
    let router = AppRouter()
    let service = TopMusicsService()
}
