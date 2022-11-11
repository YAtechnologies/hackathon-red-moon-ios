//
//  Created by Thabet
//  Copyright (c) 2021 Yassir S.P.A. All rights reserved.

import YassirUI
import Foundation
import YassirNetworking
import UIKit
import SDWebImage
import SwiftUI

class MainViewController: UITabBarController {
    
    lazy var homeViewController: UIHostingController<HomeScreen> = {
        var homeScreen = HomeScreen()
            .onBannerTap { [weak self] banner in
                //self?.didTapBanner(banner)
            }
            .onShortcutTap { [weak self] shortcut in
                self?.didTapShortcut(shortcut)
            }
            .onAvatarTap { [weak self] in
                //self?.didTapUserAvatar()
            }
        let vc = UIHostingController(rootView: homeScreen)
        homeScreen.homeScreenVM.userFirstName = "Amin"
        
        vc.tabBarItem.title = Localize("HOME")
        vc.tabBarItem.image = UIImage(yassirImageName: .home).imageWith(newSize: CGSize(width: 24, height: 24))
        vc.tabBarItem.selectedImage = UIImage(yassirImageName: .homeAlt).imageWith(newSize: CGSize(width: 24, height: 24))
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController]
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        /// Top tab bar shadow.
        tabBar.layer.shadowOffset = .zero
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.15
        requestAuthorizations()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "didReceiveOpenUnifiedHome"), object: nil, queue: nil) { [weak self] _ in
            guard let self = self else {return}
            self.viewControllers?[0] = self.homeViewController
            self.selectedIndex = 0
        }
    }
    
    private func requestAuthorizations() {
    }
    
    private func didTapShortcut(_ shortcut: Shortcut) {
            traditionalShortcutHandling(shortcut)
    }
    
    private func traditionalShortcutHandling(_ shortcut: Shortcut) {
        switch shortcut.platform {
        case .express:
            let serviceDetailsListVC = ServiceDetailsListVC()
            serviceDetailsListVC.modalPresentationStyle = .fullScreen
            present(serviceDetailsListVC, animated: true)
        case .market:
            break
        case .rideHailing:
            print("BLOP")
            //viewControllers?[0] = ApplicationManagerHostViewController(managedViewController: rideApplication.viewController)
        case .Training:
            print("BLOP")
        case .Health:
            print("BLOP")
        case .DigitalMarketing:
            print("BLOP")
        case .ArtisanalMarket:
            print("BLOP")
        case .ContentCreation:
            print("BLOP")
        case .Finance:
            print("BLOP")
        case .WritingTranslation:
            print("BLOP")
        case .Legal:
            print("BLOP")
        }
    }
}

