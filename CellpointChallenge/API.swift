//  This file was automatically generated and should not be edited.

import Apollo

public final class GetOrganizationRepositoriesQuery: GraphQLQuery {
  public static let operationString =
    "query GetOrganizationRepositories($name: String!) {\n  organization(login: $name) {\n    __typename\n    name\n    repositories(first: 100) {\n      __typename\n      nodes {\n        __typename\n        name\n        stargazers {\n          __typename\n          totalCount\n        }\n        primaryLanguage {\n          __typename\n          name\n        }\n        owner {\n          __typename\n          login\n        }\n      }\n    }\n  }\n}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("organization", arguments: ["login": GraphQLVariable("name")], type: .object(Organization.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(organization: Organization? = nil) {
      self.init(snapshot: ["__typename": "Query", "organization": organization.flatMap { (value: Organization) -> Snapshot in value.snapshot }])
    }

    /// Lookup a organization by login.
    public var organization: Organization? {
      get {
        return (snapshot["organization"] as? Snapshot).flatMap { Organization(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "organization")
      }
    }

    public struct Organization: GraphQLSelectionSet {
      public static let possibleTypes = ["Organization"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("repositories", arguments: ["first": 100], type: .nonNull(.object(Repository.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, repositories: Repository) {
        self.init(snapshot: ["__typename": "Organization", "name": name, "repositories": repositories.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The organization's public profile name.
      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(snapshot: snapshot["repositories"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nodes: [Node?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (snapshot["nodes"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Node?] in value.map { (value: Snapshot?) -> Node? in value.flatMap { (value: Snapshot) -> Node in Node(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
            GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, stargazers: Stargazer, primaryLanguage: PrimaryLanguage? = nil, owner: Owner) {
            self.init(snapshot: ["__typename": "Repository", "name": name, "stargazers": stargazers.snapshot, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> Snapshot in value.snapshot }, "owner": owner.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// A list of users who have starred this starrable.
          public var stargazers: Stargazer {
            get {
              return Stargazer(snapshot: snapshot["stargazers"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "stargazers")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (snapshot["primaryLanguage"] as? Snapshot).flatMap { PrimaryLanguage(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "primaryLanguage")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(snapshot: snapshot["owner"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "owner")
            }
          }

          public struct Stargazer: GraphQLSelectionSet {
            public static let possibleTypes = ["StargazerConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int) {
              self.init(snapshot: ["__typename": "StargazerConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes = ["Language"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String) {
              self.init(snapshot: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes = ["Organization", "User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeOrganization(login: String) -> Owner {
              return Owner(snapshot: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Owner {
              return Owner(snapshot: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }
          }
        }
      }
    }
  }
}

public final class RepositoryDetailsQuery: GraphQLQuery {
  public static let operationString =
    "query RepositoryDetails($repositoryName: String!, $ownerName: String!) {\n  repository(name: $repositoryName, owner: $ownerName) {\n    __typename\n    name\n    description\n    id\n  }\n}"

  public var repositoryName: String
  public var ownerName: String

  public init(repositoryName: String, ownerName: String) {
    self.repositoryName = repositoryName
    self.ownerName = ownerName
  }

  public var variables: GraphQLMap? {
    return ["repositoryName": repositoryName, "ownerName": ownerName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["name": GraphQLVariable("repositoryName"), "owner": GraphQLVariable("ownerName")], type: .object(Repository.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> Snapshot in value.snapshot }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String, description: String? = nil, id: GraphQLID) {
        self.init(snapshot: ["__typename": "Repository", "name": name, "description": description, "id": id])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the repository.
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The description of the repository.
      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class GetUserRepositoriesQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserRepositories($name: String!) {\n  user(login: $name) {\n    __typename\n    name\n    repositories(first: 100) {\n      __typename\n      nodes {\n        __typename\n        name\n        stargazers {\n          __typename\n          totalCount\n        }\n        primaryLanguage {\n          __typename\n          name\n        }\n        owner {\n          __typename\n          login\n        }\n      }\n    }\n  }\n}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["login": GraphQLVariable("name")], type: .object(User.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(user: User? = nil) {
      self.init(snapshot: ["__typename": "Query", "user": user.flatMap { (value: User) -> Snapshot in value.snapshot }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (snapshot["user"] as? Snapshot).flatMap { User(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("repositories", arguments: ["first": 100], type: .nonNull(.object(Repository.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(name: String? = nil, repositories: Repository) {
        self.init(snapshot: ["__typename": "User", "name": name, "repositories": repositories.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The user's public profile name.
      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(snapshot: snapshot["repositories"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nodes: [Node?]? = nil) {
          self.init(snapshot: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (snapshot["nodes"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Node?] in value.map { (value: Snapshot?) -> Node? in value.flatMap { (value: Snapshot) -> Node in Node(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
            GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, stargazers: Stargazer, primaryLanguage: PrimaryLanguage? = nil, owner: Owner) {
            self.init(snapshot: ["__typename": "Repository", "name": name, "stargazers": stargazers.snapshot, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> Snapshot in value.snapshot }, "owner": owner.snapshot])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// A list of users who have starred this starrable.
          public var stargazers: Stargazer {
            get {
              return Stargazer(snapshot: snapshot["stargazers"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "stargazers")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (snapshot["primaryLanguage"] as? Snapshot).flatMap { PrimaryLanguage(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "primaryLanguage")
            }
          }

          /// The User owner of the repository.
          public var owner: Owner {
            get {
              return Owner(snapshot: snapshot["owner"]! as! Snapshot)
            }
            set {
              snapshot.updateValue(newValue.snapshot, forKey: "owner")
            }
          }

          public struct Stargazer: GraphQLSelectionSet {
            public static let possibleTypes = ["StargazerConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(totalCount: Int) {
              self.init(snapshot: ["__typename": "StargazerConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return snapshot["totalCount"]! as! Int
              }
              set {
                snapshot.updateValue(newValue, forKey: "totalCount")
              }
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes = ["Language"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String) {
              self.init(snapshot: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes = ["Organization", "User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeOrganization(login: String) -> Owner {
              return Owner(snapshot: ["__typename": "Organization", "login": login])
            }

            public static func makeUser(login: String) -> Owner {
              return Owner(snapshot: ["__typename": "User", "login": login])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username used to login.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }
          }
        }
      }
    }
  }
}