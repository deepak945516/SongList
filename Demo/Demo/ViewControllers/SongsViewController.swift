//
//  SongsViewController.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import UIKit

final class SongsViewController: BaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private var songTableView: UITableView!
    private let refreshControl = UIRefreshControl()
    private var songsViewModel: SongsViewModel!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private Methods
    private func initialSetup() {
        songsViewModel = SongsViewModel()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        songTableView.refreshControl = refreshControl
        songTableView.register(UINib(nibName: SongTableViewCell.className, bundle: nil), forCellReuseIdentifier: SongTableViewCell.className)
        title = "Songs"
        navigationItem.largeTitleDisplayMode = .always
        songTableView.rowHeight = UITableView.automaticDimension
        songTableView.estimatedRowHeight = 100
        fetchData()
    }
    
    private func fetchData(isRefresh: Bool = false) {
        if isRefresh {
            refreshControl.beginRefreshing()
        } else {
            showActivityIndicator()
        }
        songsViewModel.getSongs() { [unowned self] _ in
            if isRefresh {
                refreshControl.endRefreshing()
            } else {
                hideActivityIndicator()
            }
            songTableView.reloadData()
        }
    }
    
    @IBAction private func pullToRefresh() {
        fetchData(isRefresh: true)
    }
}

// MARK: - UITableViewDataSource
extension SongsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        songsViewModel.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songsViewModel.numberOfRows(in: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.className) as? SongTableViewCell {
            cell.configure(data: songsViewModel.data(at: indexPath))
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension SongsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let songDetailViewController = storyboard.instantiateViewController(withIdentifier: SongDetailsViewController.className) as? SongDetailsViewController else {
            return
        }
        songDetailViewController.songListViewModel = songsViewModel.data(at: indexPath)
        navigationController?.pushViewController(songDetailViewController, animated: true)
    }
}

