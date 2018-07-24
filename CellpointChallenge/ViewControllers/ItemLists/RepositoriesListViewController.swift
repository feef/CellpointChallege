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
        let repositoriesSortedByStargazers = repositories.sorted {
            return $0.stargazersCount > $1.stargazersCount
        }
        let repositoriesGroupedByLanguage = repositoriesSortedByStargazers.reduce([String: [Repository]]()) { aggregate, repository in
            let language = repository.language
            var updatedAggregate = aggregate
            var repositoryArray = aggregate[language] ?? [Repository]()
            repositoryArray.append(repository)
            updatedAggregate[language] = repositoryArray
            return updatedAggregate
        }
        let repositoriesSortedByLanguage = repositoriesGroupedByLanguage.sorted {
            return $0.value.count > $1.value.count
        }
        super.init(groupedModels: repositoriesSortedByLanguage, cellGenerator: RepositoryTableViewCellGenerator().wrapped)
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
