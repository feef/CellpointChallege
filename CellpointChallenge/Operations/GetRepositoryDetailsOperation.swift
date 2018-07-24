//
//  GetRepositoryDetailsOperation.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import Apollo

class GetRespositoryDetailsOperation: AsynchronousOperation, ResultGeneratingOperation {
    typealias Completion = (OperationResult<RepositoryMetadata>) -> Void
    internal let onComplete: Completion
    private let repositoryDetailsQuery: RepositoryDetailsQuery
    
    init(repositoryName: String, ownerName: String, onComplete: @escaping Completion) {
        self.onComplete = onComplete
        self.repositoryDetailsQuery = RepositoryDetailsQuery(repositoryName: repositoryName, ownerName: ownerName)
    }
    
    override func start() {
        super.start()
        ApolloClient.shared.fetch(query: repositoryDetailsQuery) { result, error in
            let completionResult: OperationResult<RepositoryMetadata>
            defer {
                self.state = .finished
                self.onComplete(completionResult)
            }
            
            guard let repository = result?.data?.repository else {
                completionResult = .failure(error)
                return
            }
            
            let description = repository.description
            let metadata = RepositoryMetadata.new(id: repository.id, repositoryDescription: description)
            completionResult = .success(metadata)
        }
    }
}
