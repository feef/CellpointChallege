//
//  TableViewCellGenerator.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

protocol TableViewCellGenerator {
    associatedtype CellType: UITableViewCell
    associatedtype ModelType
    
    func registerCells(in tableView: UITableView)
    func cellReuseIdentifier() -> String

    func generateCell() -> CellType
    func decorateCell(_ cell: CellType, with model: ModelType)
}

extension TableViewCellGenerator {
    func cellReuseIdentifier() -> String {
        return String(describing: Self.self) + "-" + String(describing: CellType.self)
    }
    
    func registerCells(in tableView: UITableView) {
        tableView.register(CellType.self, forCellReuseIdentifier: cellReuseIdentifier())
    }
}
