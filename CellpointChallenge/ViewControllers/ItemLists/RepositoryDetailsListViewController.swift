//
//  RepositoryDetailsListViewController.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class RepositoryDetailsListViewController: ItemsListViewController<UITableViewCell, String> {
    let repository: Repository
    let repositoryMetadata: RepositoryMetadata
    
    // MARK: - Init
    
    init(repository: Repository, repositoryMetadata: RepositoryMetadata) {
        self.repository = repository
        self.repositoryMetadata = repositoryMetadata
        let stringValues = [
            "name: \(repository.name)",
            "id: \(repositoryMetadata.id!)",
            "description: \(repositoryMetadata.repositoryDescription ?? "none")",
            "owner name: \(repository.ownerName)",
            "language: \(repository.language)",
            "stargazers count: \(repository.stargazersCount)"
        ]
        super.init(groupedModels: [(nil, stringValues)], cellGenerator: StringTableViewCellGenerator.wrapped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.isUserInteractionEnabled = false
    }
}
