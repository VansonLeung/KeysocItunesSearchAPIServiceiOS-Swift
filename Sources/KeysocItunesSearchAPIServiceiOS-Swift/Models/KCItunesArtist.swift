//
//  KCItunesArtist.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation


/// Define the Artist struct to match the API response structure
public struct KCItunesArtist: Codable {
    public let wrapperType: String?
    public let artistType: String?
    public let artistName: String?
    public let artistLinkUrl: URL?
    public let artistId: Int?
    public let amgArtistId: Int?
    public let primaryGenreName: String?
    public let primaryGenreId: Int?
}
