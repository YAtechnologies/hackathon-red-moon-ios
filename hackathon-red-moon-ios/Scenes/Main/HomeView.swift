

import SwiftUI
import YassirUI

public struct HomeView: View {
    @ObservedObject public var homeVM = HomeViewModel()
    
    public var emitServiceShortcut: ServiceTapEmit = nil
    public var emitSliderBanner: SliderTapEmit = nil
    
    public init(userDetails: UserDetails = .notAvailable) {
        homeVM.userDetails = userDetails
        homeVM.loadHomeViewConfiguration()
    }
    
    public var body: some View {
            ScrollView(.vertical, showsIndicators: false)  {
                VStack(alignment: .leading, spacing: 16) {
                    if case let .available(userFirstName) = homeVM.userDetails {
                        WelcomeView(userFirstName: userFirstName)
                    }
                    ForEach(homeVM.components) { component in
                        switch component {
                        case .service(let service):
                            ServiceView(viewModel: ServiceViewModel(service: service))
                                .onEmit { shortcut in
                                    emitServiceShortcut?(shortcut)
                                }
                                .padding(.bottom, 16)
                        case .slider(let slider):
                            SliderView(viewModel: SliderViewModel(slider: slider))
                                .onEmit { banner in
                                    emitSliderBanner?(banner)
                                }
                        }
                    }
                }
        }
        .emptyState(homeVM.homeViewState)
        .onAppear {
            UIScrollView.appearance().bounces = true
        }
        
        if (homeVM.components.count == 0 &&
            homeVM.homeViewState == .isEmpty(.networkError))
        {
            Button {
                homeVM.loadHomeViewConfiguration()
            } label: {
                ReloadButtonView()
                    .padding(.top, 4)
            }
        }
        Spacer(minLength: 0)
    }
}

struct ReloadButtonView: View {
    var body: some View {
        Text(Localize("RELOAD"))
            .frame(width: 99, height: 36)
            .background(Color(UIColor.gray100))
            .foregroundColor(Color(UIColor.black))
            .font(Font(TextStyle.Body.regular))
            .cornerRadius(24)
    }
}

struct WelcomeView: View {
    var userFirstName: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(Localize("WELCOME") + " \(userFirstName),")
                .font(Font(TextStyle.Title.title1))
                .foregroundColor(Color(UIColor.gray900))
            Text(Localize("WELCOME_DESCRIPTION"))
                .font(Font(TextStyle.Subtitle.regular))
                .foregroundColor(Color(UIColor.gray900))
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}


/// Public Module API
public extension HomeView {
    
    /// Perform an action when the user tap on specified shortcut.
    typealias ServiceTapEmit = ((Shortcut) -> Void)?
    /// Perform an action when the user tap on specified Banner.
    typealias SliderTapEmit = ((Banner) -> Void)?
    
    
    /// Perform an action when the user tap on a shortcut,
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
    
}

