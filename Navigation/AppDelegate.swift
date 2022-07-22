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
    var arrayUrl: [AppConfiguration] = [
        .configOne(URL(string:"https://swapi.dev/api/people/8")!),
        .configTwo(URL(string:"https://swapi.dev/api/starships/3")!),
        .configThree(URL(string:"https://swapi.dev/api/planets/5")!)
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        coordinator = MainCoordinator(window: window!)
        coordinator?.start()
        
        let appConfiguration: AppConfiguration = arrayUrl.randomElement()!
        
        switch appConfiguration {
        case .configOne(let urlOne):
            NetworkService.dataTask(url: urlOne) { (data) in
                print(data ?? "Данных нет")
            }
            
        case .configTwo(let urlTwo):
            NetworkService.dataTask(url: urlTwo) { (data) in
                print(data ?? "Данных нет")
            }
        case .configThree(let urlThree):
            NetworkService.dataTask(url: urlThree) { (data) in
                print(data ?? "Данных нет")
            }
        }
        return true
    }
}

