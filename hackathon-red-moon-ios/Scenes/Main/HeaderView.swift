//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

public typealias AvatarTapEmit = (() -> Void)?

public struct HeaderView: View {
    @ObservedObject private var headerVM = HeaderViewModel()
    
    var action: AvatarTapEmit = nil
    
    public init(userDetails: UserDetails = .notAvailable) {
        headerVM.userDetails = userDetails
        headerVM.fetchCurrentLocation()
    }
    
    public var body: some View {
        HStack {
            AddressView(addressStatus: headerVM.addressStatus)
            Spacer()
            switch headerVM.userDetails {
            case .notAvailable:
                UserAvatarView()
            case .available(let firstName):
                Button {
                    action?()
                } label: {
                    UserAvatarView(firstName: firstName)
                }
            }
        }
        .padding(18)
        .overlay( headerVM.addressStatus == .fetching ? nil : Rectangle()
                    .frame(width: nil, height: 0.5)
                    .foregroundColor(Color(.gray100))
                    .shadow(color: Color(.gray100), radius: 2, x: 0, y: 0),
                  alignment: .bottom
        )
    }
}

extension HeaderView {
    /// API to emit avatar tap action out of HomeUI module
    public func onAvatarTap(perform action: AvatarTapEmit) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

struct UserAvatarView: View {
    var firstName: String?
    
    var body: some View {
        if let firstName = firstName, firstName.trimmingCharacters(in: .whitespaces).count > 0 {
            CircledButton(
                text: String(firstName.first ?? " ").uppercased(),
                foregroundColor: Color(UIColor.gray900),
                backgroundColor: Color(UIColor.warning500),
                width: 46, height: 46, lineWidth: 2)
        } else {
            Circle()
                .fill(Color(UIColor.gray50))
                .frame(width: 46, height: 46)
        }
    }
}

struct AddressView: View {
    var addressStatus: AddressStatus
    
    var body: some View {
        switch addressStatus {
        case .available(let address):
            AddressDetailsView(address: address)
        case .notAvailable:
            AddressDetailsView()
        case .fetching:
            FetchingAddressView()
        }
    }
}

struct AddressDetailsView: View {
    var address: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            Text(address == nil ? Localize("LOCATION_UNAVAILABLE") : Localize("LOCATION"))
                .font(Font(TextStyle.Title.title3))
                .foregroundColor(Color(UIColor.tint900))
            
            Text(address ?? Localize("LOCATION_UNAVAILABLE_DESCRIPTION"))
                .font(Font(TextStyle.Body.regular))
                .foregroundColor(Color(UIColor.black))
        }
    }
}

struct FetchingAddressView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            Text(Localize("SEARCHING"))
                .font(Font(TextStyle.Title.title3))
                .foregroundColor(Color(UIColor.tint900))
        }
    }
}
