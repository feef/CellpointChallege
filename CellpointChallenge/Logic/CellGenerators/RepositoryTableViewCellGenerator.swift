//
//  RepositoryTableViewCellGenerator.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class RepositoryTableViewCellGenerator {
    // MARK: - Any wrapper
        
    lazy var wrapped = AnyTableViewCellGenerator(generateCell: self.generateCell, decorateCell: self.decorateCell)
}

extension RepositoryTableViewCellGenerator: TableViewCellGenerator {
    func generateCell() -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier())
    }
    
    func decorateCell(_ cell: UITableViewCell, with model: Repository) {
        cell.textLabel?.text = model.name
    }
}
