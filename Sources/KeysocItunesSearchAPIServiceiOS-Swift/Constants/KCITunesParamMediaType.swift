//
//  File.swift
//  
//
//  Created by Vanson Leung on 13/9/2023.
//

import Foundation

public struct KCItunesParamMediaType {
    let val: String?
}

public struct KCItunesParamMediaTypeManager {
    public static let shared = KCItunesParamMediaTypeManager()
    
    public var MediaTypeListArray : [KCItunesParamMediaType]
    public var MediaTypeDictMappingByVal : [String: KCItunesParamMediaType]
    
    init() {
        MediaTypeListArray = MediaTypeListArrayRawDataSource.map({ dict in
            KCItunesParamMediaType(
                val: dict["val"]
            )
        })
        
        var c_dict_val : [String: KCItunesParamMediaType] = [:]
        
        for it in MediaTypeListArray {
            if let val = it.val {
                c_dict_val[val] = it
            }
        }
        
        MediaTypeDictMappingByVal = c_dict_val
    }
    
    
    public var MediaTypeListArrayRawDataSource = [
        [
            "val": "movie",
        ],
        [
            "val": "podcast",
        ],
        [
            "val": "music",
        ],
        [
            "val": "musicVideo",
        ],
        [
            "val": "audiobook",
        ],
        [
            "val": "shortFilm",
        ],
        [
            "val": "tvShow",
        ],
        [
            "val": "software",
        ],
        [
            "val": "ebook",
        ],
        [
            "val": "all",
        ],
    ]
}
