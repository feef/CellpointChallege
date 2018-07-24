//
//  RepositoriesListViewController.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class RepositoriesListViewController: ItemsListViewController<UITableViewCell, Repository>, UITableViewDelegate {
    
    // MARK: - Init
    
    init(repositories: [Repository]) {
        // TODO: do grouping
        super.init(groupedModels: [("all", repositories)], cellGenerator: RepositoryTableViewCellGenerator().wrapped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = dataSource.modelAtIndexPath(indexPath) else {
            // TODO: Add debug log
            return
        }
        // TODO: Use model to fetch repository details and show appropriate details screen
    }
}
