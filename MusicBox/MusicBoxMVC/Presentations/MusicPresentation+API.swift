

import Foundation
import MusicBoxAPI

extension MusicPresentation {
    
    convenience init(music: Music) {
        self.init(title: music.name, detail: music.artistName)
    }
}
