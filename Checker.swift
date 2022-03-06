//
//  Checker.swift
//  
//
//  Created by Владлен on 03.03.2022.
//

import Foundation
import UIKit

class Checker {
    
    private let login = "User"
    
    private let password = "Password"
    
    static var shared = Checker()
    
    private init() { }
    
    func loginChecker(enteredLogin: String, enteredPswrd: String) -> Bool {
        return enteredLogin == login && enteredPswrd == password
    }
}
