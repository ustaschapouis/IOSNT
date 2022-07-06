//
//  CoordinatorFactory.swift
//  Navigation
//
//  Created by Владлен on 29.03.2022.
//

import Foundation
import UIKit

class CoordinatorFactory: goToPostVC {
    
   static func goToPost() -> PostViewController {
        let postVM = PostViewModel()
        let postVC = PostViewController(viewModel: postVM)
        return postVC
    }
    
    
}
