//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Владлен on 22.03.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let window: UIWindow?
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let tabBarController = UITabBarController()
        let firstItem = UITabBarItem(title: "Feed", image: UIImage(named: "feedIcon"), tag: 0)
        let secondItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), tag: 1)
        
        let feedCoordinator = FeedCoordinator(navigationController: UINavigationController())
        feedCoordinator.parentCoordinator = self
        childCoordinators.append(feedCoordinator)
        let feedVC = feedCoordinator.startPush()
        feedVC.tabBarItem = firstItem
        
        let profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
        profileCoordinator.parentCoordinator = self
        childCoordinators.append(profileCoordinator)
        let profVC = profileCoordinator.startPush()
        profVC.tabBarItem = secondItem
        
        tabBarController.viewControllers = [feedVC, profVC]
        tabBarController.tabBar.backgroundColor = .white
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        print("123")
        
    }
}
