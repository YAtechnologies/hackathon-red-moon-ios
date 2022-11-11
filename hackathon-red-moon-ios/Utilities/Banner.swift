//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

// MARK: - Banner
public struct Banner: Codable, Identifiable {
    public var id = UUID().uuidString
    public let title, description: String?
    public let displayTitle, displayDescription: Bool
    public let imageURL: URL
    public let action: Action?
    public let order: Int

    enum CodingKeys: String, CodingKey {
        case title
        case displayTitle = "display_title"
        case action = "action"
        case displayDescription = "display_description"
        case imageURL = "image"
        case description, order
    }
    
    public init(displayTitle: Bool, displayDescription: Bool, title: String, description: String, order: Int, action: Action?, imageURL : URL){
        self.displayTitle = displayTitle
        self.displayDescription = displayDescription
        self.title = title
        self.description = description
        self.order = order
        self.action = nil
        self.imageURL = imageURL
    }
}

// MARK: - Action
public struct Action: Codable {
    public let linkURL: URL?
    public let target: Target
    
    enum CodingKeys: String, CodingKey {
        case target
        case linkURL = "link"
    }
}

public enum Target: String, Codable {
    case inApp = "IN_APP"
    case webView = "IN_WEB"
    case none
}
