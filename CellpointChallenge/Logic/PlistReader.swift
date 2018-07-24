//
//  PlistReader.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation

struct PlistReader {
    static let privatePlistDictionary: [String: Any] = dictionaryContentsOfPlist(named: "Private")!
    
    private static func dictionaryContentsOfPlist(named fileName: String) -> [String: Any]? {
        guard
            let fileURL = Bundle.main.url(forResource: fileName, withExtension: "plist"),
            let data = try? Data(contentsOf: fileURL),
            let plistDictionary = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any]
        else {
            return nil
        }
        return plistDictionary
    }
}
