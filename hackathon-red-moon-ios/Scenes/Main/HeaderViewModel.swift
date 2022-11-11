//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation
import CoreLocation

enum AddressStatus: Equatable {
    case fetching, available(_ formattedAddress: String), notAvailable
}

class HeaderViewModel: UserDetailsViewModel {
    @Published var addressStatus: AddressStatus = .fetching

    func fetchCurrentLocation() {
        getFormattedAddress()
    }
    
    private func getFormattedAddress() {
        self.addressStatus = AddressStatus.available("Blida")
    }
}

public enum UserDetails: Equatable {
    case notAvailable
    case available(_ firstName: String)
}
