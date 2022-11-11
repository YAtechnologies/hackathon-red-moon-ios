//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation
import SwiftUI
import YassirNetworking
import CoreLocation

public class HomeViewModel: UserDetailsViewModel {
    @Published public var components = [Component]()
    @Published public var homeViewState: HomeViewState = .isLoading
    
    public func loadHomeViewConfiguration() {
        homeViewState = .isLoading
        fetchConfiguration()
    }
    
    public func fetchConfiguration() {
        let shortcut = Shortcut(imageURL: URL(string: "https://i.ibb.co/KLs7qvD/Screen-Shot-2022-11-11-at-11-26-28-AM.png")!, platform: .rideHailing, title: "Course", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut1 = Shortcut(imageURL: URL(string: "https://i.ibb.co/sm0K0Dq/Screen-Shot-2022-11-11-at-11-29-04-AM.png")!, platform: .express, title: "Express", url: URL(string: "https://yatechnologies.page.link/WFVp")!)
        
        let shortcut2 = Shortcut(imageURL: URL(string: "https://i.ibb.co/Lgg29yQ/Screen-Shot-2022-11-11-at-11-32-16-AM.png")!, platform: .Training, title: "Training", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut3 = Shortcut(imageURL: URL(string: "https://i.ibb.co/4FbBjRm/Screen-Shot-2022-11-11-at-11-46-29-AM.png")!, platform: .Health, title: "Health", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut4 = Shortcut(imageURL: URL(string: "https://i.ibb.co/wNr51Jn/Screen-Shot-2022-11-11-at-11-38-53-AM.png")!, platform: .DigitalMarketing, title: "Digital Marketing", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut5 = Shortcut(imageURL: URL(string: "https://i.ibb.co/wYn8HSX/Screen-Shot-2022-11-10-at-11-25-20-PM.png")!, platform: .ArtisanalMarket, title: "Artisanal market", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut6 = Shortcut(imageURL: URL(string: "https://i.ibb.co/L06mjqc/Screen-Shot-2022-11-11-at-11-42-04-AM.png")!, platform: .ContentCreation, title: "Content creation", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut7 = Shortcut(imageURL: URL(string: "https://i.ibb.co/28mwrZ5/Screen-Shot-2022-11-10-at-11-08-44-PM.png")!, platform: .Finance, title: "Finance", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut8 = Shortcut(imageURL: URL(string: "https://i.ibb.co/5MQpNGZ/Screen-Shot-2022-11-10-at-11-21-55-PM.png")!, platform: .WritingTranslation, title: "Writing/translation", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let shortcut9 = Shortcut(imageURL: URL(string: "https://i.ibb.co/x3fPkdJ/Screen-Shot-2022-11-10-at-11-08-13-PM.png")!, platform: .Legal, title: "Legal", url: URL(string: "https://rider-link.yassir.com/staging-main")!)
        
        let service = Service(shortcuts: [shortcut, shortcut1, shortcut2, shortcut3, shortcut4, shortcut5, shortcut6, shortcut7, shortcut8, shortcut9])
        
        let banner = Banner(displayTitle: true, displayDescription: true, title: "Why has Yassir launched a tech hub in Berlin?", description: "Our Berlin office is home to a rapidly growing number of incredible teams who strive to live the mission of Yassir", order: 1, action: nil, imageURL: URL(string: "https://storage.googleapis.com/test_one_app/staging/banners/8c8dcd474755/8c8dcd474755.jpeg")!)
        
        let slider = Slider(displayTitle: true, displayDescription: true, title: "Know more about Yassir", description: "Know more about us and discover what are our plans for the future", banners: [banner])
        
        let component = Component(service: service)
        let component2 = Component(slider :slider)
        
        self.components = [component, component2]
        self.homeViewState = .data
    }
}

public enum HomeViewState: Equatable {
    case isLoading
    case isEmpty(_ emptyStatus: EmptyStatus)
    case data
    public enum EmptyStatus {
        case networkError, noInternet, outOfCoverageLocation, notSpecified
    }
}
