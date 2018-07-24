//
//  RepositoryMetadata.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import RealmSwift

class RepositoryMetadata: Object {
    @objc dynamic var id: String!
    @objc dynamic var repositoryDescription: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func new(id: String, repositoryDescription: String?) -> RepositoryMetadata {
        let metadata = RepositoryMetadata()
        metadata.id = id
        metadata.repositoryDescription = repositoryDescription
        return metadata
    }
}
