//
//  Coordinator.swift
//  Navigation
//
//  Created by Владлен on 22.03.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
