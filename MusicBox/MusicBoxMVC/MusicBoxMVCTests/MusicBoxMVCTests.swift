//
//  MusicBoxMVCTests.swift
//  MusicBoxMVCTests
//
//  Created by Gizem Boskan on 21.10.2021.
//

import XCTest
@testable import MusicBoxAPI
@testable import MusicBoxMVC

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
        
        let music1 = try! ResourceLoader.loadMusic(resource: .music1)
        service.musics = [music1]
        
        controller.loadViewIfNeeded()
        
        XCTAssertEqual(view.isLoadingValues, [true, false])
        XCTAssertEqual(view.musicList?.count, 1)
        XCTAssertEqual( try view.musicList?.element(at: 0).title, music1.name)
        
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
