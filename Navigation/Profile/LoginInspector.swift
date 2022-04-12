//
//  LoginInspector.swift
//  Navigation
//
//  Created by Владлен on 06.03.2022.
//

import Foundation
import UIKit

class LoginInspector: LoginViewControllerDelegate {
    func checkLoginPassword(login: String, password: String) -> Bool {
        let checker = Checker.shared.loginChecker(enteredLogin: login, enteredPswrd: password)
        return checker
    }
}
