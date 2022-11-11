//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

fileprivate class BundleLocator {}
extension Bundle {
    static var yassirHomeUI: Bundle {
        #if SWIFT_PACKAGE
            return .module
        #else
            return Bundle(for: BundleLocator.self)
        #endif
    }
}

extension Bundle {
    var homeConfigURL: URL {
        guard let url = url(forResource: "YassirHome-Config", withExtension: "plist") else {
            fatalError("Unable to locate `YassirHome-Config.plist`.")
        }
        return url
    }
}
