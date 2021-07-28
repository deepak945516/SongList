//
//  SongModel.swift
//  Demo
//
//  Created by Deepak Kumar on 26/07/21.
//

import Foundation

// MARK: - Songs
struct Songs: Decodable {
    let resultCount: Int?
    let results: [Result]?
}

// MARK: - Result
struct Result: Decodable {
    let wrapperType: String?
    let artistID, collectionID: Int?
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: String?
    let trackCount: Int?
    let copyright: String?
    let country: String?
    let currency: String?
    let releaseDate: String?
    let primaryGenreName: String?
    let previewURL: String?
    let resultDescription: String?
    let amgArtistID: Int?
    let kind: String?
    let trackID: Int?
    let trackName, trackCensoredName: String?
    let trackViewURL: String?
    let artworkUrl30: String?
    let trackRentalPrice, trackHDRentalPrice: Double?
    let trackExplicitness: String?
    let trackTimeMillis: Int?
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let trackPrice, collectionHDPrice, trackHDPrice: Double?
    let hasITunesExtras: Bool?
    let collectionArtistID: Int?
    let collectionArtistViewURL: String?
    let discCount, discNumber, trackNumber: Int?
    let isStreamable: Bool?
    let collectionArtistName: String?
}
