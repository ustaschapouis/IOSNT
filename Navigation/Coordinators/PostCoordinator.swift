//
//  PostCoordinator.swift
//  Navigation
//
//  Created by Владлен on 29.03.2022.
//

import Foundation
import UIKit

class PostCoordinator: Coordinator {
    weak var parentCoordinator: FeedCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let module = CoordinatorFactory.goToPost()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        module.viewModel.coordinator = self
        navigationController.pushViewController(module, animated: true)
    }
    
  

}
