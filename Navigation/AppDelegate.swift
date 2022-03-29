//
//  AppDelegate.swift
//  Navigation
//
//  Created by Владлен Морозов on 27.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: MainCoordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        coordinator = MainCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
    
}

