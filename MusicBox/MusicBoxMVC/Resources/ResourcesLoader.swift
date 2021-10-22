//
//  ResourcesLoader.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation
import Utility
import MusicBoxAPI

class ResourceLoader {
    
    enum MusicResource: String {
        case music1
        case music2
        case music3
    }
    
    static func loadMovie(resource: MusicResource) throws -> Music {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: resource.rawValue, withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let music = try decoder.decode(Music.self, from: data)
        return music
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
