//
//  File.swift
//  
//
//  Created by Vanson Leung on 13/9/2023.
//

import Foundation

public struct KCItunesParamMediaType {
    public let val: String?
    public let val_en: String?
    public let val_zh_hk: String?
    public let val_zh_cn: String?
}

public struct KCItunesParamMediaTypeManager {
    public static let shared = KCItunesParamMediaTypeManager()
    
    public var MediaTypeListArray : [KCItunesParamMediaType]
    public var MediaTypeDictMappingByVal : [String: KCItunesParamMediaType]
    
    init() {
        MediaTypeListArray = MediaTypeListArrayRawDataSource.map({ dict in
            KCItunesParamMediaType(
                val: dict["val"],
                val_en: dict["val_en"],
                val_zh_hk: dict["val_zh_hk"],
                val_zh_cn: dict["val_zh_cn"]
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
            "val_en": "Movies",
            "val_zh_hk": "影片",
            "val_zh_cn": "影片",
        ],
        [
            "val": "podcast",
            "val_en": "Podcasts",
            "val_zh_hk": "播客",
            "val_zh_cn": "播客",
        ],
        [
            "val": "music",
            "val_en": "Music",
            "val_zh_hk": "音樂",
            "val_zh_cn": "音乐",
        ],
        [
            "val": "musicVideo",
            "val_en": "Music Videos",
            "val_zh_hk": "音樂視頻",
            "val_zh_cn": "音乐视频",
        ],
        [
            "val": "audiobook",
            "val_en": "Audiobooks",
            "val_zh_hk": "有聲書",
            "val_zh_cn": "有声书",
        ],
        [
            "val": "shortFilm",
            "val_en": "Short Films",
            "val_zh_hk": "短片",
            "val_zh_cn": "短片",
        ],
        [
            "val": "tvShow",
            "val_en": "TV Shows",
            "val_zh_hk": "電視劇",
            "val_zh_cn": "电视剧",
        ],
        [
            "val": "software",
            "val_en": "Software",
            "val_zh_hk": "軟件",
            "val_zh_cn": "软件",
        ],
        [
            "val": "ebook",
            "val_en": "Ebooks",
            "val_zh_hk": "電子書",
            "val_zh_cn": "电子书",
        ],
        [
            "val": "all",
            "val_en": "All",
            "val_zh_hk": "全部",
            "val_zh_cn": "全部",
        ],
    ]
}
