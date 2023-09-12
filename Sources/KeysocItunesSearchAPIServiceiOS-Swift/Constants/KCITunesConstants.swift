//
//  KCITunesConstants.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation

public struct KCItunesConstants {
    
    public static var shared: KCItunesConstants {
        return KCItunesConstants()
    }
    
    let baseURL = "https://itunes.apple.com/search"
    
    public enum NetworkError: Error {
        case invalidURL
        case noData
        // Add other error cases as needed
    }
}
