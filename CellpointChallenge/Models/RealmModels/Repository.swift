//
//  Repository.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Repository: Object {
    @objc dynamic private var realmID = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var ownerName = ""
    @objc dynamic var language = ""
    @objc dynamic var stargazersCount = 0
    
    override static func primaryKey() -> String? {
        return "realmID"
    }
    
    static func new(name: String, ownerName: String, language: String, stargazersCount: Int) -> Repository {
        let repository = Repository()
        repository.name = name
        repository.ownerName = ownerName
        repository.language = language
        repository.stargazersCount = stargazersCount
        return repository
    }
}
