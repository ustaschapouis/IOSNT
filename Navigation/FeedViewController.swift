//
//  FeedViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 27.08.2021.
//

import UIKit



class FeedViewController: UIViewController {

    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        
        let button1: MyCustomButton = {
        let button1 = MyCustomButton(title: "Button1", color: .black, target: tap)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button1.backgroundColor = .systemGray
        button1.layer.cornerRadius = 10
        button1.layer.shadowOffset = CGSize(width: 4, height: 4)
        button1.layer.shadowRadius = 4
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOpacity = 0.5
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return button1
        }()
        
        let button2: MyCustomButton = {
        let button2 = MyCustomButton(title: "Button2", color: .black, target: tap)
        button2.setTitleColor(.black, for: .normal)
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button2.backgroundColor = .systemGray2
        button2.layer.cornerRadius = 10
        button2.layer.shadowOffset = CGSize(width: 4, height: 4)
        button2.layer.shadowRadius = 4
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.5
        button2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return button2
        }()
        
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 16
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
    @objc func tap() {
        let postVC = PostViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(postVC, animated: true)
        
    }
    
    
    
}
    








    

