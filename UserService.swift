//
//  UserService.swift
//  Navigation
//
//  Created by Владлен on 20.03.2022.
//

import Foundation
import UIKit

protocol UserService {
    func returnUser(userName: String) throws -> User
}
