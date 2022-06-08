//
//  TextFieldChecker.swift
//  Navigation
//
//  Created by Владлен on 15.03.2022.
//

import Foundation
import UIKit

class TextChecker {
    
    private let correctText = "Password"
    
    func check(word: String) -> Bool {
        if word == correctText {
            return true
        } else {
            return false
        }
    }
}



