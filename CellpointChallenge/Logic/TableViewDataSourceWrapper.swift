//
//  TableViewDataSourceWrapper.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class TableViewDataSourceWrapper<CellType: UITableViewCell, ModelType>: NSObject, UITableViewDataSource {
    let groupedModels: [(String, [ModelType])]
    let cellGenerator: AnyTableViewCellGenerator<CellType, ModelType>
    
    init(groupedModels: [(String, [ModelType])], cellGenerator: AnyTableViewCellGenerator<CellType, ModelType>) {
        self.groupedModels = groupedModels
        self.cellGenerator = cellGenerator
    }
    
    // MARK: - Setup
    
    func setupWithTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        cellGenerator.registerCells(in: tableView)
    }
    
    func modelAtIndexPath(_ indexPath: IndexPath) -> ModelType? {
        let section = indexPath.section
        guard groupedModels.count > section else {
            return nil
        }
        let modelsInSection = groupedModels[section].1
        let row = indexPath.row
        guard modelsInSection.count > row else {
            return nil
        }
        return modelsInSection[row]
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < groupedModels.count else {
            // TODO: Add debug log
            return 0
        }
        
        return groupedModels[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGenerator.cellReuseIdentifier()) ?? cellGenerator.generateCell()
        guard let typedCell = cell as? CellType else {
            // TODO: Add debug log
            return cell
        }
        let model = groupedModels[indexPath.section].1[indexPath.row]
        cellGenerator.decorateCell(typedCell, with: model)
        return cell
    }
}
