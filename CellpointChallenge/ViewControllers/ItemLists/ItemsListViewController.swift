//
//  RItemsListViewController.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class ItemsListViewController<CellType: UITableViewCell, ModelType>: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let dataSource: TableViewDataSourceWrapper<CellType, ModelType>
    
    // MARK - Init
    
    init(groupedModels: [(String?, [ModelType])], cellGenerator: AnyTableViewCellGenerator<CellType, ModelType>) {
        dataSource = TableViewDataSourceWrapper(groupedModels: groupedModels, cellGenerator: cellGenerator)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        dataSource.setupWithTableView(tableView)
    }
}


