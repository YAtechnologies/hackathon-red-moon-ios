//
// Copyright (c) 2020 Yassir S.P.A. All rights reserved.
//

import YassirAuth

final class AuthHelper {
    private (set) static var shared: AuthHelper!

    static func initialize() throws {
        shared = try AuthHelper()
    }

    let authClient: AuthClient
    var isAuthenticated: Bool { authClient.currentAccount != nil }
    var currentAccount: Account? { authClient.currentAccount }

    init() throws {
        authClient = try AuthClient()
    }

    func deletePersistedAccount() throws {
        try authClient.deletePersistedAccount()
    }
}
