//
//  MyCustomTextField.swift
//  Navigation
//
//  Created by Владлен on 15.03.2022.
//

import Foundation
import UIKit

class MyCustomTextField: UITextField {
    
    init(font: UIFont, textColor: UIColor, backgroundColor: UIColor, placeholder: String) {
        super.init(frame: .zero)
        
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
