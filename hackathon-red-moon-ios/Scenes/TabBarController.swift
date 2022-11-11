
import UIKit
/*
class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let projectsTab = UINavigationController(rootViewController: HomeViewController())
        let createTab = UINavigationController(rootViewController: HomeViewController())
        let settingsTab = UINavigationController(rootViewController: HomeViewController())
        
        let projectsIcon = UITabBarItem(title: "HOME", image: UIImage(named: "homeNS.png"), selectedImage: UIImage(named: "homeS.png"))
        let createIcon = UITabBarItem(title: "SEARCH", image: UIImage(named: "searchNS.png"), selectedImage: UIImage(named: "searchS.png"))
        let settingsIcon = UITabBarItem(title: "MORE", image: UIImage(named: "settingsNS.png"), selectedImage: UIImage(named: "settingsS.png"))
        
        projectsTab.tabBarItem = projectsIcon
        projectsTab.navigationBar.isHidden = true
        
        createTab.tabBarItem = createIcon
        createTab.navigationBar.isHidden = true
        
        settingsTab.tabBarItem = settingsIcon
        settingsTab.navigationBar.isHidden = true
        
        //self.tabBar.tintColor = Constants.Colors.EvoRed
        //self.tabBar.unselectedItemTintColor = .gray100
        self.tabBar.barTintColor = .black
        self.viewControllers = [projectsTab, createTab, settingsTab]
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
*/
