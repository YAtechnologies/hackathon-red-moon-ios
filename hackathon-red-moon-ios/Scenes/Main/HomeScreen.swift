//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

public struct HomeScreen: View {
    
    @ObservedObject public var homeScreenVM = HomeScreenViewModel()
    
    public var emitServiceShortcut: ServiceTapEmit = nil
    public var emitSliderBanner: SliderTapEmit = nil
    public var emitUserAvatar: AvatarTapEmit = nil
            
    public init(userDetails: UserDetails = .notAvailable){
        homeScreenVM.userDetails = userDetails
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            HeaderView(userDetails: homeScreenVM.userDetails)
                .onAvatarTap(perform: emitUserAvatar)
            
            HomeView(userDetails: homeScreenVM.userDetails)
                .onShortcutTap(perform: emitServiceShortcut)
                .onBannerTap(perform: emitSliderBanner)
        }
    }
}

/// Public Module API
public extension HomeScreen {
    
    /// Perform an action when the user tap on specified shortcut.
    typealias ServiceTapEmit = ((Shortcut) -> Void)?
    /// Perform an action when the user tap on specified Banner.
    typealias SliderTapEmit = ((Banner) -> Void)?
    /// Perform an action when the user tap on the avatar button.
    typealias AvatarTapEmit = (() -> Void)?
    
    
    /// Perform an action when the user tap on a shortcut.
    ///
    /// - Parameters:
    ///     - action: Closure to execute on a shortcut tap.
    func onShortcutTap(perform action: ServiceTapEmit) -> Self {
        var copy = self
        copy.emitServiceShortcut = action
        return copy
    }
    
    /// Perform an action when the user tap on a banner, note that if the banner has a valid web link it will opened in a safari sheet and you will not receive this.
    ///
    /// - Parameters:
    ///     - action: Closure to execute on a banner tap.
    func onBannerTap(perform action: SliderTapEmit) -> Self {
        var copy = self
        copy.emitSliderBanner = action
        return copy
    }
    
    /// Perform an action when the user tap on the avatar button.
    ///
    /// - Parameters:
    ///     - action: Closure to execute on user avatar tap.
    func onAvatarTap(perform action: AvatarTapEmit) -> Self {
        var copy = self
        copy.emitUserAvatar = action
        return copy
    }
    
}
