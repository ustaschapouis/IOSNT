//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by Владлен on 23.03.2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    var loginInspector = LoginInspector()
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func start() {
        print("PROFILE")
    }
    
    func startPush() -> UINavigationController {
        let profileVC = LoginViewController()
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
        profileVC.delegate = MyLoginFactory().loginFactoryInspector()
        print("PROFILE")
        return navigationController
   
    }
}
