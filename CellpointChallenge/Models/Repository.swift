//
//  Repository.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import RealmSwift

class Repository: Object {
    @objc dynamic private var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var ownerName = ""
    @objc dynamic var metadata: RepositoryMetadata?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
