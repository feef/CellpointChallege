//
//  UserSearchViewController.swift
//  CellpointChallenge
//
//  Created by sharif ahmed on 7/23/18.
//  Copyright © 2018 Feef Anthony. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {
    private enum GithubUserType: Int {
        case user, organization
    }
    
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var userTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private var continueButton: UIButton!
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameTextField.becomeFirstResponder()
    }
    
    // MARK: - Button response
    
    @IBAction private func tappedContinue() {
        var alert: UIAlertController? = nil
        defer {
            if let alert = alert {
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
        
        guard
            let username = usernameTextField.text?.trimmingCharacters(in: [" "]),
            username.isEmpty == false
        else {
            alert = UIAlertController(title: "Missing name", message: "Please input a valid username", preferredStyle: .alert)
            return
        }
        
        guard let userType = GithubUserType(rawValue: userTypeSegmentedControl.selectedSegmentIndex) else {
            assertionFailure("Encountered unexpected segmented control index")
            alert = UIAlertController(title: "Error", message: "Please select a different user type", preferredStyle: .alert)
            return
        }
        
        attemptToShowRepositories(forUsername: username, ofUserType: userType)
    }
        
    private func attemptToShowRepositories(forUsername username: String, ofUserType userType: GithubUserType) {
        continueButton.isEnabled = false
        
        let onComplete: (OperationResult<[Repository]>) -> Void = { result in
            defer {
                self.continueButton.isEnabled = true
            }
            switch result {
                case .failure:
                    let alert = UIAlertController(title: "Could not find user", message: "Please input a valid username and user type combination", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                    // TODO: Add debug log
                case .success(let repositories):
                    // TODO: Push view controller showing list of repos
                    NSLog("\(repositories)")
            }
        }
        
        let operation: AsynchronousOperation
        switch userType {
            case .user:
                operation = GetUserRepositoriesOperation(username: username, onComplete: onComplete)
            case .organization:
                operation = GetOrganizationRepositoriesOperation(username: username, onComplete: onComplete)
        }
        OperationQueue.main.addOperation(operation)
    }
}
