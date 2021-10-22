//
//  Array+Helpers.swift
//  Utility
//
//  Created by Gizem Boskan on 22.10.2021.
//

import Foundation

public extension Array {
    
    struct IndexOutOfBoundsError: Error { }
    
    func element(at index: Int) throws -> Element {
        guard index >= 0 && index < self.count else {
            throw IndexOutOfBoundsError()
        }
        return self[index]
    }
}
