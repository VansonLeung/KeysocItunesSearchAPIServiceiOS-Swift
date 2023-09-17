//
//  KCItunesSong.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation


/// Define the Song struct to match the API response structure
public struct KCItunesSong: Codable {
    public let wrapperType: String?
    public let kind: String?
    public let artistId: Int?
    public let collectionId: Int?
    public let trackId: Int?
    public let artistName: String?
    public let collectionName: String?
    public let trackName: String?
    public let collectionCensoredName: String?
    public let trackCensoredName: String?
    public let artistViewUrl: URL?
    public let collectionViewUrl: URL?
    public let trackViewUrl: URL?
    public let previewUrl: URL?
    public let artworkUrl30: URL?
    public let artworkUrl60: URL?
    public let artworkUrl100: URL?
    public let collectionPrice: Double?
    public let trackPrice: Double?
    public let releaseDate: String?
    public let collectionExplicitness: String?
    public let trackExplicitness: String?
    public let discCount: Int?
    public let discNumber: Int?
    public let trackCount: Int?
    public let trackNumber: Int?
    public let trackTimeMillis: Int?
    public let country: String?
    public let currency: String?
    public let primaryGenreName: String?
    public let isStreamable: Bool?
}
