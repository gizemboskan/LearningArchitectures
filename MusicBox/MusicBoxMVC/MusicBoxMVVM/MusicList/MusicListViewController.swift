//
//  MusicListViewController.swift
//  MusicBoxMVVM
//
//  Created by Gizem Boskan on 21.10.2021.
//

import UIKit
import MusicBoxAPI

final class MusicListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: MusicListViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    private var musicList: [MusicPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MusicListViewController: MusicListViewModelDelegate {
    func navigate(to route: MusicListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MusicDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
    
    
    func handleViewModelOuput(_ output: MusicListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showMusicList(let musicList):
            self.musicList = musicList
            tableView.reloadData()
        }
        
    }
}
extension MusicListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath)
        let music = musicList[indexPath.row]
        cell.textLabel?.text = music.title
        cell.detailTextLabel?.text = music.detail
        return cell
    }
    
    
}

extension MusicListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectMusicPath(at: indexPath.row)
    }
}
