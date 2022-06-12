//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Владлен on 20.03.2022.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
    
    let user = User(userName: "User")
    
    func returnUser(userName: String) throws -> User {
        if userName == user.userName {
            return user
        }
        throw AuthError.incorrect
        }
}
