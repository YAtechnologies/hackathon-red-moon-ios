

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let LaunchVC = LaunchVC()
        LaunchVC.delegate = self
        self.window?.rootViewController = LaunchVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func navigateToNewRoot(isLoggedIn: Bool) {
        let SignVC = SignVC()
        SignVC.delegate = self
        let vc = isLoggedIn ? TabBarController() : SignVC
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("[AppDelegate] : navigateToNewRoot()")
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = navigationController
                UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: {}, completion: nil)
            }
        }
    }
}

extension AppDelegate : LaunchVCDelegate, SignVCDelegate {
    func LaunchDidFinishSuccessfully(isLoggedIn: Bool) {
        navigateToNewRoot(isLoggedIn: isLoggedIn)
    }
    
    func signInFinishedSuccessfully() {
        navigateToNewRoot(isLoggedIn: true)
    }
}
