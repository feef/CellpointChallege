//
//  ApolloClient.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation
import Apollo

extension ApolloClient {
    static let shared: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer 49de0da694b20ec43c931780b1f419e36668db08"]
        let url = URL(string: "https://api.github.com/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
}
