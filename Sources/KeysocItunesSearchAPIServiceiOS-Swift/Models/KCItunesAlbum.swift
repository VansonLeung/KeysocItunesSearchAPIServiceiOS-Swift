//
//  KCItunesAlbum.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation


/// Define the Album struct to match the API response structure
public struct KCItunesAlbum: Codable {
    public let wrapperType: String?
    public let collectionType: String?
    public let artistId: Int?
    public let collectionId: Int?
    public let amgArtistId: Int?
    public let artistName: String?
    public let collectionName: String?
    public let collectionCensoredName: String?
    public let artistViewUrl: URL?
    public let collectionViewUrl: URL?
    public let artworkUrl60: URL?
    public let artworkUrl100: URL?
    public let collectionPrice: Double?
    public let collectionExplicitness: String?
    public let trackCount: Int?
    public let copyright: String?
    public let country: String?
    public let currency: String?
    public let releaseDate: String?
    public let primaryGenreName: String?
}
