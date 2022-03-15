//
//  InfoViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 28.08.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        let alertButton: MyCustomButton = {
        let button = MyCustomButton(title: "Alert", color: .systemGray, target: tap)
        button.frame =  CGRect(x: 100, y: 300, width: 200, height: 50)
        button.center = self.view.center
        button.backgroundColor = .darkGray
        button.setTitleColor(.black, for: .normal)
        return button
        }()
            
        view.addSubview(alertButton)
    }
    
    @objc func tap() {
        let alertVC = UIAlertController(title: "Error", message: "Something goes wrong", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            _ in print("Cancel")
        }
        alertVC.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
            _ in print("OK")
        }
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    
       
        
      
    }


