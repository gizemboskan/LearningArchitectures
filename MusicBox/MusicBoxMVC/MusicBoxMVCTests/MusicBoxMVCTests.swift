//
//  MusicBoxMVCTests.swift
//  MusicBoxMVCTests
//
//  Created by Gizem Boskan on 21.10.2021.
//

import XCTest
@testable import MusicBoxMVC
@testable import MusicBoxAPI

class MusicBoxMVCTests: XCTestCase {
    
    private var service: MockService!
    private var view: MockMusicListView!
    var controller: MusicListViewController!
    
    override func setUpWithError() throws {
        
        service = MockService()
        view = MockMusicListView()
        controller = MusicListViewController()
        
        controller.customView = view
        controller.service = service
        
    }
    
    func testMusicList() {
        
        service.musics = []
    }
    
}

private final class MockService: TopMusicsServiceProtocol {
    
    var musics: [Music] = []
    func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void) {
        completion(.success(TopMusicsResponse(results: musics)))
    }
    
    
}

private final class MockMusicListView: MusicListViewProtocol {
    
    var delegate: MusicListViewDelegate?
    var musicList: [MusicPresentation]?
    var isLoadingValues: [Bool] = []
    
    func updateMusicList(_ musicList: [MusicPresentation]) {
        self.musicList = musicList
    }
    
    func setLoading(_ isLoading: Bool) {
        isLoadingValues.append(isLoading)
    }
    
    
}
