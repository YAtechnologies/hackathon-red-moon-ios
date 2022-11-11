//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public struct Shortcut: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case title, platform
        case imageURL = "icon"
        case url = "link"
    }

    public let id: UUID = UUID()
    public let title: String?
    public let imageURL: URL
    public let platform: Platform
    public let url: URL?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try? container.decodeIfPresent(String.self, forKey: .title)
        imageURL = try container.decode(URL.self, forKey: .imageURL)
        platform = try container.decode(Platform.self, forKey: .platform)
        url = try? container.decodeIfPresent(URL.self, forKey: .url)
    }
    
    public init(imageURL: URL, platform: Platform, title: String, url: URL) {
        self.title = title
        self.imageURL = imageURL
        self.platform = platform
        self.url = url
    }
}
