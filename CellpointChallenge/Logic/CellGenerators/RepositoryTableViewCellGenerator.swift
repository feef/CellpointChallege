//
//  RepositoryTableViewCellGenerator.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

struct RepositoryTableViewCellGenerator {
    
    // MARK: - Any wrapper
    
    static let wrapped: AnyTableViewCellGenerator<UITableViewCell, Repository> = {
        let generator = RepositoryTableViewCellGenerator()
        return AnyTableViewCellGenerator(generateCell: generator.generateCell, decorateCell: generator.decorateCell)
    }()
}

// MARK: - TableViewCellGenerator

extension RepositoryTableViewCellGenerator: TableViewCellGenerator {
    func generateCell() -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier())
    }
    
    func decorateCell(_ cell: UITableViewCell, with model: Repository) {
        cell.textLabel?.text = model.name
    }
}
