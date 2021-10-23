//
//  MusicPresentation.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit

final class MusicPresentation: NSObject {
    
    let title: String
    let detail: String
    
    init(title: String, detail: String){
        self.title = title
        self.detail = detail
        super.init()
    }
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MusicPresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}


