//
//  AppConfiguration.swift
//  Navigation
//
//  Created by Владлен on 24.07.2022.
//

import Foundation

enum AppConfiguration: String, CaseIterable {
    
    case people = "https://swapi.dev/api/people"
    case starships = "https://swapi.dev/api/starships"
    case planets = "https://swapi.dev/api/planets"
    
    static var stringURL: String {
        AppConfiguration.allCases.randomElement()?.rawValue ?? people.rawValue
    }
}
