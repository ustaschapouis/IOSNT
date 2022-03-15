//
//  File.swift
//  Navigation
//
//  Created by Владлен on 03.03.2022.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    
    func checkLoginPassword(login: String, password: String) -> Bool
}
