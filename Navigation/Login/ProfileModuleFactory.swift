//
//  ProfileModuleFactory.swift
//  Navigation
//
//  Created by Владлен on 12.06.2022.
//

import Foundation

class ProfileModuleFactory{
    func produceProfileVC(userService: UserService, userName: String) -> ProfileViewController {
        return ProfileViewController(userService: userService, enteredUserName: userName)
    }
    
//    func produceProfileViewModel() -> ProfileViewModel {
//        return ProfileViewModel()
//    }
}
