//
//  Result.swift
//  MusicBoxAPI
//
//  Created by Gizem Boskan on 21.10.2021.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
