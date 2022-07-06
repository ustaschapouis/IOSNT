//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Владлен on 22.03.2022.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        print("FEED")
    }
    
    func startPush() -> UINavigationController {
        let feedVC = FeedViewController()
        feedVC.coordinator = self
        navigationController.pushViewController(feedVC, animated: true)
        print("FEED")
        return navigationController
    }
}

