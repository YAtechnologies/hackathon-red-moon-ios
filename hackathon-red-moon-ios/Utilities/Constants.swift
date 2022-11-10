
import Foundation
import UIKit

enum HomeSections: Int {
    case Control
    case Projects
}

enum SettingsRows: String, CaseIterable {
    case Help = "Help"
    case Logout = "Logout"
}

struct Constants {
    // get Base url from info.plist
    static let BASE_URL = Bundle.main.infoDictionary?["ServerBaseURL"] as! String
    // custom colors
    struct Colors {
        static let D_WHITE = UIColor.white
    }
    
    struct DeviceSize {
        static let DeviceWidth = UIScreen.main.bounds.width
        static let DeviceHeight = UIScreen.main.bounds.height
    }
    
    struct ImageAssetsNames {
        static let launchScreenImage = "LaunchS2"
        static let loginScreenImage = "loginS6"
        static let profileImage = "ProfilePic"
    }
    
    // app urls
    struct Urls {
        //Sign end points
        struct Launch {
            static let serverStatus = "/server_status"
        }
        struct Sign {
            static let login = "/login"
        }
        struct Home {
            //Home endpoints
            static let getPopular = "/get_projects"
        }
    }
    
    // keys for userDefault and keychain
    struct Keys {
        static let isLoggedKey = "is_logged"
        static let emailKey = "email"
        static let nameKey = "name"
        static let userTokenKey = "user_token"
        static let userIdkey = "userID"
    }
    
    
}
