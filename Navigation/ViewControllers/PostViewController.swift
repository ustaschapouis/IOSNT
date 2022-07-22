//
//  PostViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 27.08.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    let viewModel: PostViewModel
    init(viewModel: PostViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        title = "Post"
        
        let button: MyCustomButton = {
            let button = MyCustomButton(title: "InfoViewController", color: .systemGray, target: tap)
            button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
            button.center = self.view.center
            button.setTitleColor(.black, for: .normal)
            return button
        }()
        view.addSubview(button)
        
    }
    
    @objc func tap() {
        let postVC = InfoViewController()
        postVC.modalPresentationStyle = .pageSheet
        postVC.modalTransitionStyle = .coverVertical
        self.present(postVC, animated: true, completion: nil)
        
    }
}
