//
//  TopMusicsResponse.swift
//  MusicBoxAPI
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

public struct TopMusicsResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
  public let results: [Music]
    
    init(results: [Music]) {
           self.results = results
       }
    
    public init(from decoder: Decoder) throws {
        
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Music].self, forKey: .results)
    }
}
