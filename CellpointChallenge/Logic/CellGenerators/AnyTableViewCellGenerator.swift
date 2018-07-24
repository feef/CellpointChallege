//
//  AnyTableViewCellGenerator.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class AnyTableViewCellGenerator<CellType: UITableViewCell, ModelType> {
    typealias GenerateCellBlock = () -> CellType
    typealias DecorateCellBlock = (CellType, ModelType) -> Void
    
    private let _generateCell: GenerateCellBlock
    private let _decorateCell: DecorateCellBlock
    
    init(generateCell: @escaping GenerateCellBlock, decorateCell: @escaping DecorateCellBlock) {
        _generateCell = generateCell
        _decorateCell = decorateCell
    }
}

extension AnyTableViewCellGenerator: TableViewCellGenerator {
    func generateCell() -> CellType {
        return _generateCell()
    }
    
    func decorateCell(_ cell: CellType, with model: ModelType) {
        _decorateCell(cell, model)
    }
}
