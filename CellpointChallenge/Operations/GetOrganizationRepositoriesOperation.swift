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
    private let organizationRepositoriesQuery: GetOrganizationRepositoriesQuery
    
    init(username: String, onComplete: @escaping Completion) {
        self.onComplete = onComplete
        self.organizationRepositoriesQuery = GetOrganizationRepositoriesQuery(name: username)
    }
    
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
                guard let name = $0?.name,
                    let ownerName = $0?.owner.login
                else {
                    return nil
                }
                return Repository.new(name: name, ownerName: ownerName)
            }
            completionResult = .success(repositories)
        }
    }
}
