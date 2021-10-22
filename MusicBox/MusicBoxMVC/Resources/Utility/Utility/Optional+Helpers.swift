//
//  Optional+Helpers.swift
//  Utility
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation

public extension Optional {
    
    struct FoundNilWhileUnwrappingError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
