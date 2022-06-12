//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Владлен on 23.03.2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    var loginInspector = LoginInspector()
    var navigationController: UINavigationController
    
    var inspectorFactory = MyLoginFactory()
    var moduleFactory = ProfileModuleFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        
    }
    
    func start() {
        print("PROFILE")
    }
    
    func startPush() -> UINavigationController {
        let profileVC = LoginViewController()
        profileVC.loginFactory = inspectorFactory
        profileVC.pushProfile = { [weak self] UserService, username in
            self?.showProfileVC(userService: UserService, username: username)
        }
            navigationController.setViewControllers([profileVC], animated: false)
            return navigationController
        }
//        profileVC.coordinator = self
//        navigationController.pushViewController(profileVC, animated: true)
//        profileVC.delegate = MyLoginFactory().loginFactoryInspector()
//        print("PROFILE")
//        return navigationController
        
    }

extension ProfileCoordinator {
    func showProfileVC(userService: UserService, username: String) {
        let profileVC = moduleFactory.produceProfileVC(userService: userService, userName: username)
        navigationController.pushViewController(profileVC, animated: true)
    }
}

