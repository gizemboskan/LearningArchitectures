//
//  MusicListViewController.swift
//  MusicBoxVIPER
//
//  Created by Gizem Boskan on 1.05.2022.
//

import UIKit

final class MusicListViewController: UIViewController, MusicListViewProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var musics: [MusicPresentation] = []
    var presenter: MusicListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func handleOutput(_ output: MusicListPresenterOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showMusicList(let musics):
            self.musics = musics
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension MusicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath)
        let music = musics[indexPath.row]
        cell.textLabel?.text = music.title
        cell.detailTextLabel?.text = music.detail
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        presenter.selectMusic(at: indexPath.row)
    }
}
