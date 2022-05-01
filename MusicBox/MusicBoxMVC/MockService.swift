//
//  MockService.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation
@testable import MusicBoxAPI

final class MockService: TopMusicsServiceProtocol {
    
    var musics: [Music] = []
    func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void) {
        completion(.success(TopMusicsResponse(results: musics)))
    } 
}
