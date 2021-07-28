//
//  SongsViewModel.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import Foundation

struct SongsViewModel {
    private var songs: Songs?
    private var songListViewModel: [SongListViewModel] = []
    
    mutating func getSongs(_ completion: @escaping ((Bool) -> ())) {
        let songData = SwiftHelper.getJSONData(fileName: "Songs")
        songs = SwiftHelper.getModel(from: songData)
        songListViewModel = songs?.results?.compactMap { SongListViewModel(model: $0) } ?? []
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(true)
        }
    }
    
    var numberOfSections: Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        songListViewModel.count
    }
    
    func data(at indexPath: IndexPath) -> SongListViewModel {
        songListViewModel[indexPath.row]
    }
}
