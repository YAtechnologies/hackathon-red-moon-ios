//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public struct Service: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case shortcuts = "services"
    }
    
    public let id = UUID()
    public let shortcuts: [Shortcut]
    
    public init(shortcuts: [Shortcut]){
        self.shortcuts = shortcuts
    }
}

