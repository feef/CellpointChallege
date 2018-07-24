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
    @objc dynamic var id: String!
    @objc dynamic var name = ""
    @objc dynamic var repositoryDescription: String?
    @objc dynamic var ownerName = ""
    @objc dynamic var language = ""
    @objc dynamic var stargazersCount = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func new(id: String, name: String, repositoryDescription: String?, ownerName: String, language: String, stargazersCount: Int) -> Repository {
        let repository = Repository()
        repository.id = id
        repository.name = name
        repository.repositoryDescription = repositoryDescription
        repository.ownerName = ownerName
        repository.language = language
        repository.stargazersCount = stargazersCount
        return repository
    }
}
