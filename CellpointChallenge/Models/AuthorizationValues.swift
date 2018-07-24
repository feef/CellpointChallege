//
//  AuthorizationValues.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/24/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import Foundation

class AuthorizationValues {
    private struct Constants {
        static let plistName = "Private"
        static let githubTokenKey = "GithubAuthenticationToken"
    }
        
    static let githubToken = PlistReader.privatePlistDictionary[Constants.githubTokenKey] as! String
}
