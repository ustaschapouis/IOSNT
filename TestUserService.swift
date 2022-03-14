//
//  TestUserService.swift
//  Navigation
//
//  Created by Владлен on 03.03.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    let user = User()
    
    func returnUser(userName: String) -> User? {
        if userName == user.userName {
            return user
        } else {
            return nil
        }
    }
}
