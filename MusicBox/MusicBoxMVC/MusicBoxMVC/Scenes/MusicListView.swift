//
//  MusicListView.swift
//  MusicBoxMVC
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit

final class MusicListView: UIView {
    
    weak var delegate: MusicListViewDelegate?
    private var musicList: [MusicPresentation] = []
    @IBOutlet private weak var tableView: UITableView!
    
}

extension MusicListView: MusicListViewProtocol {
    
    func updateMusicList(_ musicList: [MusicPresentation]) {
        self.musicList = musicList
        tableView.reloadData()
    }
    
    func setLoading(_ isLoading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
}

extension MusicListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath)
        let music = musicList[indexPath.row]
        cell.textLabel?.text = music.title
        cell.detailTextLabel?.text = music.detail
        return cell
    }
    
    
}

extension MusicListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.didSelectMusic(at: indexPath.row)
    }
}
