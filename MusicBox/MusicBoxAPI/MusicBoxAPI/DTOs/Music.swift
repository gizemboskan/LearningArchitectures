//
//  Music.swift
//  MusicBoxAPI
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

// MARK: - Music
public struct Music: Decodable, Equatable {
    
    public enum CodingKeys: String, CodingKey {
        case artistName
        case releaseDate
        case name
        case image = "artworkUrl100"
        case genres
    }
    
    public let artistName: String
    public let releaseDate: String
    public let name: String
    public let image: String
    public let genres: [Genre]
}

// MARK: - Genre
public struct Genre: Decodable, Equatable {
    public let name: Name
}

// MARK: - Name
public enum Name: String, Decodable, Equatable {
    case alternative = "Alternative"
    case childrenSMusic = "Children's Music"
    case country = "Country"
    case hipHopRap = "Hip-Hop/Rap"
    case music = "Music"
    case pop = "Pop"
    case rBSoul = "R&B/Soul"
    case soundtrack = "Soundtrack"
}
