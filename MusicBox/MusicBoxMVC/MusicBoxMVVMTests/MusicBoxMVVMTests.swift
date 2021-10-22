//
//  MusicBoxMVVMTests.swift
//  MusicBoxMVVMTests
//
//  Created by Gizem Boskan on 22.10.2021.
//

import XCTest
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
    
    func testExample() throws {
        // Given:
//        let music1 = try ResourceLoader.loadMusic(resource: )
        
        // When:
        
        // Then:
    }
    
    
    private class MockView: MusicListViewModelDelegate {
        
        var outputs: [MusicListViewModelOutput] = []
        func handleViewModelOuput(_ output: MusicListViewModelOutput) {
            outputs.append(output)
        }
    }
}
