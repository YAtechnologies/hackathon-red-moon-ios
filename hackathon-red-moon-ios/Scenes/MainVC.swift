//
// Copyright (c) 2020 Yassir S.P.A. All rights reserved.
//

import UIKit
import YassirUI
import SwiftUI
import AppTrackingTransparency
import YassirHomeKit
import YassirHomeUI
import SafariServices

fileprivate class ApplicationManagerHostViewController: UIViewController {
    private let managedViewController: UIViewController

    override var tabBarItem: UITabBarItem! {
        set { managedViewController.tabBarItem = newValue }
        get { managedViewController.tabBarItem }
    }

    required init(managedViewController: UIViewController) {
        self.managedViewController = managedViewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        managedViewController.willMove(toParent: self)
        addChild(managedViewController)
        managedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(managedViewController.view)
        NSLayoutConstraint.activate([
            managedViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            managedViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            managedViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            managedViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        managedViewController.didMove(toParent: self)
    }
}

class CouponCenterNavigationController: UINavigationController {

    init() {
        super.init(nibName: nil, bundle: nil)
        //viewControllers = [couponListVC]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = nil
        navigationBar.topItem?.title = Localize("DISCOUNTS")
    }
    
}

class MainViewController: UITabBarController {
    
    private lazy var couponCenterNavigationController: CouponCenterNavigationController = {
        let vc = CouponCenterNavigationController()
        vc.tabBarItem.title = Localize("DISCOUNTS")
        vc.tabBarItem.image = UIImage(yassirImageName: .coupon).imageWith(newSize: CGSize(width: 24, height: 24))
        vc.tabBarItem.selectedImage = #imageLiteral(resourceName: "DiscountTabItem.Fill")
        return vc
    }()

    lazy var homeViewController: UIHostingController<HomeScreen> = {
        var homeScreen = HomeScreen()
            .onBannerTap { [weak self] banner in
                self?.didTapBanner(banner)
            }
            .onShortcutTap { [weak self] shortcut in
                self?.didTapShortcut(shortcut)
            }
            .onAvatarTap { [weak self] in
                //self?.didTapUserAvatar()
            }
        let vc = UIHostingController(rootView: homeScreen)
        homeScreen.homeScreenVM.userFirstName = "thabet"
        
        vc.tabBarItem.title = Localize("HOME")
        vc.tabBarItem.image = UIImage(yassirImageName: .home).imageWith(newSize: CGSize(width: 24, height: 24))
        vc.tabBarItem.selectedImage = UIImage(yassirImageName: .homeAlt).imageWith(newSize: CGSize(width: 24, height: 24))
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController, couponCenterNavigationController]
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        /// Top tab bar shadow.
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.15
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "didReceiveOpenUnifiedHome"), object: nil, queue: nil) { [weak self] _ in
            guard let self = self else {return}
            self.viewControllers?[0] = self.homeViewController
            self.selectedIndex = 0
        }
    }
    
    private func didTapShortcut(_ shortcut: Shortcut) {
        if let url = shortcut.url {
            handleDynamicLink(link: url)
        }else {
            traditionalShortcutHandling(shortcut)
        }
    }
    
    private func traditionalShortcutHandling(_ shortcut: Shortcut) {
        switch shortcut.platform {
        case .express:
            if let appSchemeURL = URL(string: "yassirexpress://") {
                if UIApplication.shared.canOpenURL(appSchemeURL) {
                    UIApplication.shared.open(appSchemeURL, options: [:], completionHandler: nil)
                }else if let url = URL(string: "itms-apps://apple.com/app/yassir-express/id1470726498") {
                    UIApplication.shared.open(url)
                }
            }
        case .market:
            break
        case .rideHailing:
            print("clop")
            //viewControllers?[0] = ApplicationManagerHostViewController(managedViewController: rideApplication.viewController)
        }
    }
    
    private func didTapBanner(_ banner: Banner) {
        guard let target = banner.action?.target else { return }
        switch target {
            case .inApp:
                guard let link = banner.action?.linkURL else {return}
                handleDynamicLink(link: link)
            case .webView:
                print("clop")
                //openExternalURL(url: banner.action?.linkURL)
            case .none:
                break
        }
    }
    
    private func handleDynamicLink(link: URL) {/*
        let handled = DynamicLinks.dynamicLinks().handleUniversalLink(link) { [weak self] dynamicLink, error in
            guard error == nil else {return}
            if let deepLink = dynamicLink?.url, deepLink.host == "www.yassir.com", deepLink.path.starts(with: "/ride") {
                self?.handleDeepLink(url: deepLink)
            }else if UIApplication.shared.canOpenURL(link) {
                UIApplication.shared.open(link)
            }
        }
        if !handled, UIApplication.shared.canOpenURL(link) {
            UIApplication.shared.open(link)
        }*/
    }
    
    @discardableResult
    private func handleDeepLink(url: URL) -> Bool {
        switch url.path {
        case "/ride/promo":
            print("Blop")//openCouponCenter()
        case "/ride/main":
            print("Blop")//openRideHailing()
        case "/one/main":
            print("Blop")//openUnifiedHome()
        default:
            return false
        }
        return true
    }
    
}
/*
extension MainViewController: AccountNavigationControllerDelegate {
    func accountNavigationControllerDidUpdateProfile() {
        AccountAPIClient.shared.fetchUserProfile { [weak self] result in
            guard let self = self else {return}
            let userProfile = try? result.get()
            let name = userProfile?.firstName ?? userProfile?.fullName
            self.homeViewController.rootView.homeScreenVM.userFirstName = name
        }
    }
}

extension MainViewController {
    func openExternalURL(url: URL?) {
        if let url = url {
            let safariVC = SFSafariViewController(url: url)
            safariVC.modalPresentationStyle = .overFullScreen
            self.present(safariVC, animated: true)
        }
    }
}

@available(iOS 14, *)
extension MainViewController: AskForTrackingViewControllerDelegate {
    
    func askForTrackingViewControllerDidAllowTracking(vc: AskForTrackingViewController) {
        vc.dismiss(animated: true)
        requestLocationAuthorization()
    }
    
    func askForTrackingViewControllerDidDenyTracking(vc: AskForTrackingViewController) {
        vc.dismiss(animated: true)
        requestLocationAuthorization()
    }
    
}

extension MainViewController: AskForLocationPermissionViewControllerDelegate {
    func askForLocationPermissionViewControllerDidTapContinue(vc: AskForLocationPermissionViewController) {
        vc.dismiss(animated: true)
    }
}

extension MainViewController: AppSwitcherService {
    
    static var identifier: StaticString = "com.yassir.one.service.AppSwitcherService"
    
    func openYassirAssistance() {
        selectedIndex = 2
    }
    
    func openUnifiedHome() {
        // FIXME: - We're using a notification here for quick heal of an issue where replacing the first vc (Ride screen by tapping back button) by  the home screen is not working. This method is triggered but nothing happen and we stuck in the ride vc.
        // And the most weird thing is that it happen only for new users that just complete the account creation.
        // Reproduce: Splash -> SignUp -> Home -> Ride = here you can not go back to Home again by taping on the back button.
        NotificationCenter.default.post(name: NSNotification.Name("didReceiveOpenUnifiedHome"), object: nil)
    }
    
    func openCouponCenter() {
        selectedIndex = 1
    }
    
    func openRideHailing() {
        viewControllers?[0] = ApplicationManagerHostViewController(managedViewController: rideApplication.viewController)
        selectedIndex = 0
    }
}     */


