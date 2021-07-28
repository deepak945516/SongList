//
//  SongTableViewCell.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import UIKit
import SDWebImage

final class SongTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var songName: UILabel!
    @IBOutlet private weak var artistName: UILabel!
    
    // MARK: - Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(data: SongListViewModel) {
        songName.text = data.songName
        artistName.text = data.artistName
        imgView.sd_setImage(with: data.imgUrl, completed: nil)
    }
}
