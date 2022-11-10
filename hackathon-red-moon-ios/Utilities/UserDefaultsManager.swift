
import UIKit

class UserDefaultsManager: NSObject {
    
    class func isLoggedIn() -> Bool {
        if UserDefaults.standard.bool(forKey: Constants.Keys.isLoggedKey) {
            return true
        } else{
            return false
        }
    }
    
    /// store user's data after the login
    /// - Parameter data: data as dictionary
    class func storeUserData(data: String) -> Bool {
        let defaults = UserDefaults.standard
        let name = data
        let email = data
        let userId = data
        
        defaults.set(true, forKey: Constants.Keys.isLoggedKey)
        Keychain.set(data, forKey: Constants.Keys.userTokenKey)
        defaults.set(email, forKey: Constants.Keys.emailKey)
        defaults.set(name, forKey: Constants.Keys.nameKey)
        defaults.set(userId, forKey: Constants.Keys.userIdkey)
        defaults.synchronize()
        return true
    }
    
    /// logout (normal/forced)
    /// - Parameter forcedLogout : true for session expiring
    /// - Parameter completion : async result - true if logged out successfully
    class func performLogout(vc: UIViewController, forcedLogout : Bool, completion: @escaping (Bool) -> Void){
        let messageAlert = forcedLogout ? "session expired" : "Are you sure you would like to logout?"
        let alert = UIAlertController(title: "yara", message: messageAlert, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "yes", style: UIAlertAction.Style.destructive) {
            UIAlertAction in
            let loggedoutResult = logOutDeleteData()
            completion(loggedoutResult)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            completion(false)
        }
        alert.addAction(okAction)
        if !forcedLogout {
            alert.addAction(cancelAction)
        }
        vc.present(alert, animated: true, completion: nil)
    }
    
    ///Logout and clear data
    class func logOutDeleteData() -> Bool{
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: Constants.Keys.isLoggedKey)
        defaults.removeObject(forKey: Constants.Keys.nameKey)
        defaults.removeObject(forKey: Constants.Keys.emailKey)
        defaults.synchronize()
        Keychain.removeValue(forKey: Constants.Keys.userTokenKey)
        defaults.removeObject(forKey: Constants.Keys.userIdkey)
        if UserDefaults.standard.bool(forKey: Constants.Keys.isLoggedKey){
            return false
        }else{
            return true
        }
    }
    
}
