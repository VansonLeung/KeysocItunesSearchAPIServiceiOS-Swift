//
//  KCItunesSong.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation


// Define the Song struct to match the API response structure
public struct KCItunesSong: Codable {
    public let trackName: String?
    public let artistName: String?
    public let collectionName: String?
    public let previewUrl: URL? // Use URL for URL strings

    // Add other properties as needed

    // Define CodingKeys to map JSON keys to struct properties
    private enum CodingKeys: String, CodingKey {
        case trackName
        case artistName
        case collectionName
        case previewUrl = "previewUrl"
        // Add other cases for properties not matching the JSON keys
    }
}
