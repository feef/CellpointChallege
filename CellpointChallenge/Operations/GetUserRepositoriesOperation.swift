//
//  GetUserRepositoriesOperation.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import Apollo

class GetUserRepositoriesOperation: AsynchronousOperation, ResultGeneratingOperation {
    typealias Completion = (OperationResult<[Repository]>) -> Void
    internal let onComplete: Completion
    private let userRepositoriesQuery: GetUserRepositoriesQuery
    
    init(username: String, onComplete: @escaping Completion) {
        self.onComplete = onComplete
        self.userRepositoriesQuery = GetUserRepositoriesQuery(name: username)
    }
    
    override func start() {
        super.start()
        ApolloClient.shared.fetch(query: userRepositoriesQuery) { result, error in
            let completionResult: OperationResult<[Repository]>
            defer {
                self.state = .finished
                self.onComplete(completionResult)
            }
            
            guard let repositoryDatas = result?.data?.user?.repositories.nodes else {
                completionResult = .failure(error)
                return
            }
            
            let repositories: [Repository] = repositoryDatas.compactMap {
                guard let name = $0?.name,
                    let ownerName = $0?.owner.login,
                    let language = $0?.primaryLanguage?.name,
                    let stargazersCount = $0?.stargazers.totalCount
                else {
                    return nil
                }
                return Repository.new(name: name, ownerName: ownerName, language: language, stargazersCount: stargazersCount)
            }
            completionResult = .success(repositories)
        }
    }
}
