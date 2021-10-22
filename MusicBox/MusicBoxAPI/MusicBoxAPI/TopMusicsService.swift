//
//  TopMusicsService.swift
//  MusicBoxAPI
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation
import Alamofire

public protocol TopMusicsServiceProtocol {
    func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void)
}

public class TopMusicsService: TopMusicsServiceProtocol {
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    
    public init() { }
    
    public func fetchTopMusics(completion: @escaping (Result<TopMusicsResponse>) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/albums.json"
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(TopMusicsResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
