//
//  MusicBoxVIPERTests.swift
//  MusicBoxVIPERTests
//
//  Created by Gizem Boskan on 1.05.2022.
//

import XCTest
@testable import MusicBoxAPI
@testable import MusicBoxVIPER

class MusicBoxVIPERTests: XCTestCase {
    
    private var presenter: MusicListPresenter!
    private var interactor: MusicListInteractor!
    private var service: MockService!
    private var view: MockMusicListView!
    private var router: MockMusicListRouter!
    
    override func setUp() {
        service = MockService()
        interactor = MusicListInteractor(service: service)
        view = MockMusicListView()
        router = MockMusicListRouter()
        presenter = MusicListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
    }
    
    func testLoad() throws {
        // Given:
        let music1 = try ResourceLoader.loadMusic(resource: .Music1)
        let music2 = try ResourceLoader.loadMusic(resource: .Music2)
        service.musics = [music1, music2]
        
        // When:
        view.viewDidLoad()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        
        let output = try view.outputs.element(at: 0)
        switch output {
        case .updateTitle:
            break // success
        default:
            XCTFail()
        }
        
        XCTAssertEqual(try view.outputs.element(at: 1), .setLoading(true))
        XCTAssertEqual(try view.outputs.element(at: 2), .setLoading(false))
        let expectedMusics = service.musics.map(MusicPresentation.init)
       // XCTAssertEqual(try view.outputs.element(at: 3), .showMusicList(expectedMusics))
    }
    
    func testSelectMusic() throws {
        // Given:
        let music1 = try ResourceLoader.loadMusic(resource: .Music1)
        let music2 = try ResourceLoader.loadMusic(resource: .Music2)
        service.musics = [music1, music2]
        view.viewDidLoad()
        
        // When:
        view.selectMusic(at: 0)
        
        // Then:
        let extractedMusic = try service.musics.element(at: 0)
        XCTAssertEqual(try router.routes.element(at: 0), .detail(extractedMusic))
    }
}

private final class MockMusicListView: MusicListViewProtocol {
    
    var presenter: MusicListPresenter!
    var outputs: [MusicListPresenterOutput] = []
    
    func viewDidLoad() {
        presenter.load()
    }
    
    func selectMusic(at index: Int) {
        presenter.selectMusic(at: index)
    }
    
    func handleOutput(_ output: MusicListPresenterOutput) {
        outputs.append(output)
    }
}

private final class MockMusicListRouter: MusicListRouterProtocol {
    
    var routes: [MusicListRoute] = []
    
    func navigate(to route: MusicListRoute) {
        routes.append(route)
    }
}
