//
//  File.swift
//  
//
//  Created by Vanson Leung on 13/9/2023.
//

import Foundation

public struct KCItunesParamLang {
    let val: String?
}

public struct KCItunesParamLangManager {
    public static let shared = KCItunesParamLangManager()
    
    public var LangListArray : [KCItunesParamLang]
    public var LangDictMappingByVal : [String: KCItunesParamLang]
    
    init() {
        LangListArray = LangListArrayRawDataSource.map({ dict in
            KCItunesParamLang(
                val: dict["val"]
            )
        })
        
        var c_dict_val : [String: KCItunesParamLang] = [:]
        
        for it in LangListArray {
            if let val = it.val {
                c_dict_val[val] = it
            }
        }
        
        LangDictMappingByVal = c_dict_val
    }
    
    
    public var LangListArrayRawDataSource = [
        [
            "val": "en_us",
        ],
        [
            "val": "zh_hk",
        ],
        [
            "val": "zh_cn",
        ],
    ]
}
