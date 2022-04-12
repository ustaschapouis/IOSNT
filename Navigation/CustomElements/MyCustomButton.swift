//
//  MyCustomButton.swift
//  Navigation
//
//  Created by Владлен on 14.03.2022.
//

import Foundation
import UIKit

class MyCustomButton: UIButton {
    
    init(title: String, color: UIColor, target: @escaping () -> Void) {
        newTarget = target
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = color
        addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let newTarget: () -> Void
    
    @objc private func buttonIsTapped() {
        newTarget()
    }
}
