//
//  RepositoriesListViewController.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit
import RealmSwift

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
        let fullySortedRepositories = repositoriesSortedByLanguage.map { ($0 as String?, $1) }
        super.init(groupedModels: fullySortedRepositories, cellGenerator: RepositoryTableViewCellGenerator.wrapped)
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
        tableView.deselectRow(at: indexPath, animated: true)
        guard let repository = dataSource.modelAtIndexPath(indexPath) else {
            // TODO: Add debug log
            return
        }
        let repositoryDetailsListViewController = RepositoryDetailsListViewController(repository: repository)
        navigationController?.pushViewController(repositoryDetailsListViewController, animated: true)
    }
}
