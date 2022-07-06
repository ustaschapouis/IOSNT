//
//  TextFieldChecker.swift
//  Navigation
//
//  Created by Владлен on 15.03.2022.
//

import Foundation
import UIKit

enum CheckerErrors: Error {
    case incorrect
    case empty
}

class TextChecker {
    
    private let correctWord = "Password"
    
    func check(word: String, completion:  @escaping (Result<String, CheckerErrors>) -> Void  ) {
        if word == correctWord {
            completion(.success("Correct!"))
        } else if word == "" {
            completion(.failure(.empty))
        } else {
            completion(.failure(.incorrect))
        }
    }
}



