//
//  GetOrganizationRepositoriesOperation.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import Apollo

class GetOrganizationRepositoriesOperation: AsynchronousOperation, ResultGeneratingOperation {
    typealias Completion = (OperationResult<[Repository]>) -> Void
    internal let onComplete: Completion
    private let username: String
    private let organizationRepositoriesQuery: GetOrganizationRepositoriesQuery
    
    // MARK: - Init
    
    init(username: String, onComplete: @escaping Completion) {
        self.onComplete = onComplete
        self.username = username
        organizationRepositoriesQuery = GetOrganizationRepositoriesQuery(name: username)
    }
    
    // MARK: - Lifecycle
    
    override func start() {
        super.start()
        ApolloClient.shared.fetch(query: organizationRepositoriesQuery) { result, error in
            let completionResult: OperationResult<[Repository]>
            defer {
                self.state = .finished
                self.onComplete(completionResult)
            }
            
            guard let repositoryDatas = result?.data?.organization?.repositories.nodes else {
                completionResult = .failure(error)
                return
            }
            
            let repositories: [Repository] = repositoryDatas.compactMap {
                guard let id = $0?.id,
                    let name = $0?.name,
                    let ownerName = $0?.owner.login,
                    let language = $0?.primaryLanguage?.name,
                    let stargazersCount = $0?.stargazers.totalCount
                else {
                    return nil
                }
                let repository = Repository.new(id: id, name: name, repositoryDescription: $0?.description, ownerName: ownerName, language: language, stargazersCount: stargazersCount)
                return repository
            }
            completionResult = .success(repositories)
        }
    }
}
