//
//  SongDetailsViewController.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import UIKit

final class SongDetailsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var artistName: UILabel!
    @IBOutlet weak private var collectionName: UILabel!
    @IBOutlet weak private var collectionPrice: UILabel!
    
    var songListViewModel: SongListViewModel!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private Methods
    private func initialSetup() {
        title = songListViewModel.genreName
        imgView.sd_setImage(with: songListViewModel.imgUrl, completed: nil)
        artistName.text = songListViewModel.artistName
        collectionName.text = songListViewModel.collectionName
        collectionPrice.text = "$\(songListViewModel.collectionPrice)"
    }
}
