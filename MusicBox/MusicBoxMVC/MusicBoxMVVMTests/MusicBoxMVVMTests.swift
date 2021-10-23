//
//  MusicBoxMVVMTests.swift
//  MusicBoxMVVMTests
//
//  Created by Gizem Boskan on 22.10.2021.
//

import XCTest
@testable import MusicBoxAPI
@testable import MusicBoxMVVM

class MusicBoxMVVMTests: XCTestCase {
    
    private var view: MockView!
    private var viewModel: MusicListViewModel!
    private var service: MockService!
    
    override func setUpWithError() throws {
        
        service = MockService()
        viewModel = MusicListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }
    
    func testLoad() throws {
        // Given:
        let music1 = try ResourceLoader.loadMusic(resource: .Music1)
        let music2 = try ResourceLoader.loadMusic(resource: .Music2)
        service.musics = [music1, music2]
        
        // When:
        viewModel.load()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        
        switch try view.outputs.element(at: 0) {
        case .updateTitle(_):
            break // success
        default:
            XCTFail("First ouput should be updateTitle.")
        }
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        
        //  let expectedMusics = [music1, music2].map { MusicPresentation(music: $0)}
        //        XCTAssertEqual(try view.outputs.element(at: 3), .showMusicList(expectedMusics))
        
    }
    
    func testNavigation()  throws {
        // Given:
        let music1 = try ResourceLoader.loadMusic(resource: .Music1)
        let music2 = try ResourceLoader.loadMusic(resource: .Music2)
        service.musics = [music1, music2]
        viewModel.load()
        view.reset()
        // when
        viewModel.selectMusicPath(at: 0)
        
        // then
        XCTAssertTrue(view.detailRouteCalled)
        
        
    }
    private class MockView: MusicListViewModelDelegate {
        
        var outputs: [MusicListViewModelOutput] = []
        var detailRouteCalled: Bool = false
        
        func reset() {
            outputs.removeAll()
            detailRouteCalled = false
        }
        
        func navigate(to route: MusicListViewRoute) {
            
            switch route {
            case .detail:
                detailRouteCalled = true
            }
        }
        
        
        func handleViewModelOuput(_ output: MusicListViewModelOutput) {
            outputs.append(output)
        }
    }
}

