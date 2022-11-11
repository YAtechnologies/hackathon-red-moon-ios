//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public enum Component: Decodable, Identifiable {
    
    public var id: UUID {
        switch self {
        case .service(let service):
            return service.id
        case .slider(let slider):
            return slider.id
        }
    }

    case service(Service)
    case slider(Slider)

    public init(from decoder: Decoder) throws {
        if let service = try? decoder.singleValueContainer().decode(Service.self) {
            self = .service(service)
        }else if let slider = try? decoder.singleValueContainer().decode(Slider.self) {
            self = .slider(slider)
        }else {
            throw DecodingError.badType
        }
    }
    
    public init(service: Service) {
            self = .service(service)
    }
    
    public init(slider: Slider) {
            self = .slider(slider)
    }

}
