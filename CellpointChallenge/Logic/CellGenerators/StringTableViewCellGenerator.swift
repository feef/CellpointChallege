//
//  StringTableViewCellGenerator.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

struct StringTableViewCellGenerator {
    
    // MARK: - Any wrapper
    
    static let wrapped: AnyTableViewCellGenerator<UITableViewCell, String> = {
        let generator = StringTableViewCellGenerator()
        return AnyTableViewCellGenerator(generateCell: generator.generateCell, decorateCell: generator.decorateCell)
    }()
}

// MARK: - TableViewCellGenerator

extension StringTableViewCellGenerator: TableViewCellGenerator {
    func generateCell() -> UITableViewCell {
        return UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier())
    }
    
    func decorateCell(_ cell: UITableViewCell, with model: String) {
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = model
    }
}
