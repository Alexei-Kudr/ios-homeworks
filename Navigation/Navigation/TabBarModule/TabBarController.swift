//

import UIKit

final class TabBarController: UITabBarController {
    
    var feedTabNavigationController: UINavigationController!
    var profileTabNavigationController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        profileTabNavigationController = UINavigationController.init(rootViewController: LogInViewController())
        feedTabNavigationController = UINavigationController.init(rootViewController: FeedViewController())
        
        self.viewControllers = [feedTabNavigationController, profileTabNavigationController]
        
        let item1 = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        let item2 = UITabBarItem(title: "Feed", image: UIImage(systemName: "note.text"), tag: 1)
        
        profileTabNavigationController.tabBarItem = item1
        feedTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().backgroundColor = .white
    }
}

