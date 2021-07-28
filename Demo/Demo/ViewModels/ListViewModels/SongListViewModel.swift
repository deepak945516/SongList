//
//  SongListViewModel.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import Foundation

struct SongListViewModel {
    var model: Result
    
    var songName: String {
        model.trackName ?? ""
    }
    
    var artistName: String {
        model.artistName ?? ""
    }
    
    var imgUrl: URL? {
        return URL(string: model.artworkUrl100 ?? "")
    }
    
    var collectionName: String {
        model.collectionName ?? ""
    }
    
    var collectionPrice: Double {
        model.collectionPrice ?? 0.0
    }
    
    var genreName: String {
        model.primaryGenreName ?? ""
    }
}
