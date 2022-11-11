//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI

public class HomeScreenViewModel: UserDetailsViewModel {}

public class UserDetailsViewModel: ObservableObject {
    @Published public var userDetails: UserDetails = .notAvailable
    
    public var userFirstName: String? {
        didSet {
            if let userFirstName = userFirstName {
                userDetails = .available(userFirstName)
            }else {
                userDetails = .notAvailable
            }
        }
    }
}
