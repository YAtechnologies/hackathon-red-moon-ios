//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public enum Platform: String, Decodable {
    case rideHailing = "YASSIR_VTC"
    case express = "YASSIR_EXPRESS"
    case market = "YASSIR_MARKET"
    case Training = "Training"
    case Health = "Health"
    case DigitalMarketing = "DigitalMarketing"
    case ArtisanalMarket = "ArtisanalMarket"
    case ContentCreation = "ContentCreation"
    case Finance = "Finance"
    case WritingTranslation = "WritingTranslation"
    case Legal = "Legal"
    
}
