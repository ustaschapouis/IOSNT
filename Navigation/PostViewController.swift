//
//  PostViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 27.08.2021.
//

import UIKit

class PostViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        title = "Post"
       
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.center = self.view.center
            button.setTitle("InfoViewController", for: .normal)
            button.addTarget(self, action: #selector(tap), for: .touchUpInside)
            button.backgroundColor = .darkGray
            button.setTitleColor(.black, for: .normal)
            
            view.addSubview(button)
        
    }

    @objc func tap() {
        let postVC = InfoViewController()
        postVC.modalPresentationStyle = .pageSheet
        postVC.modalTransitionStyle = .coverVertical
        self.present(postVC, animated: true, completion: nil)
        
}
}
