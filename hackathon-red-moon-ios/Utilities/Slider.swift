//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public struct Slider: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case banners
        case displayTitle = "display_title"
        case displayDescription = "display_description"
    }
    
    public let id = UUID()
    public let displayTitle: Bool
    public let displayDescription: Bool
    public let title: String?
    public let description: String?
    public let banners: [Banner]
    
    public init(displayTitle: Bool, displayDescription: Bool, title: String, description: String, banners: [Banner]){
        self.displayTitle = displayTitle
        self.displayDescription = displayDescription
        self.title = title
        self.description = description
        self.banners = banners
    }
}
