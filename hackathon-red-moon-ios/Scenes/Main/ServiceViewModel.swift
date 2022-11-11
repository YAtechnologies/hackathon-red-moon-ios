//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public class ServiceViewModel: ObservableObject {
    
    var service: Service {
        didSet {
            shortcuts = chunks(shortcuts: service.shortcuts, into: 3)
        }
    }
    @Published var shortcuts: [[Shortcut]] = []
    
    public init(service: Service) {
        self.service = service
        self.shortcuts = chunks(shortcuts: service.shortcuts, into: 3)
    }

    private func chunks(shortcuts: [Shortcut], into size: Int) -> [[Shortcut]] {
        return stride(from: 0, to: shortcuts.count, by: size).map {
            Array(shortcuts[$0 ..< Swift.min($0 + size, shortcuts.count)])
        }
    }
    
}
