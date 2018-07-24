//
//  TableViewDataSourceWrapper.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class TableViewDataSourceWrapper<CellType: UITableViewCell, ModelType>: NSObject, UITableViewDataSource {
    private let sectionTitles: [String?]
    private let modelArrays: [[ModelType]]
    private let cellGenerator: AnyTableViewCellGenerator<CellType, ModelType>
    
    // MARK: - Init
    
    init(groupedModels: [(String?, [ModelType])], cellGenerator: AnyTableViewCellGenerator<CellType, ModelType>) {
        sectionTitles = groupedModels.map { $0.0 }
        self.modelArrays = groupedModels.map { $0.1 }
        self.cellGenerator = cellGenerator
    }
    
    // MARK: - Setup
    
    func setupWithTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        cellGenerator.registerCells(in: tableView)
    }
    
    // MARK: - Accessors
    
    func modelAtIndexPath(_ indexPath: IndexPath) -> ModelType? {
        let section = indexPath.section
        guard modelArrays.count > section else {
            return nil
        }
        let modelsInSection = modelArrays[section]
        let row = indexPath.row
        guard modelsInSection.count > row else {
            return nil
        }
        return modelsInSection[row]
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard sectionTitles.count > section else {
            // TODO: Add debug log
            return nil
        }
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let nonNilIndexTitles = sectionTitles.compactMap { $0 }
        return nonNilIndexTitles.count == sectionTitles.count ? nonNilIndexTitles : nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelArrays.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < modelArrays.count else {
            // TODO: Add debug log
            return 0
        }
        return modelArrays[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellGenerator.cellReuseIdentifier()) ?? cellGenerator.generateCell()
        guard
            let typedCell = cell as? CellType,
            let model = modelAtIndexPath(indexPath)
        else {
            // TODO: Add debug log
            return cell
        }
        cellGenerator.decorateCell(typedCell, with: model)
        return cell
    }
}
