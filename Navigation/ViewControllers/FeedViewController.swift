//
//  FeedViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 27.08.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var customButton1: MyCustomButton = {
        let button = MyCustomButton(title: "Press Me!", color: .red, target: enteredWordCheck)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var customTextFIeld: MyCustomTextField = {
        let textField = MyCustomTextField(font: .boldSystemFont(ofSize: 15), textColor: .black, backgroundColor: .systemGray, placeholder: "This is gonna be text")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 8
        textField.textAlignment = .center
        return textField
    }()
    
    var checker = TextChecker()
    var coordinator: Coordinator?
    let feedView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        self.title = "Feed"
        feedView.translatesAutoresizingMaskIntoConstraints = false
        
        let button1: MyCustomButton = {
            let button1 = MyCustomButton(title: "Button1", color: .black, target: tap)
            button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button1.backgroundColor = .systemGray
            button1.layer.cornerRadius = 10
            button1.layer.shadowOffset = CGSize(width: 4, height: 4)
            button1.layer.shadowRadius = 4
            button1.layer.shadowColor = UIColor.black.cgColor
            button1.layer.shadowOpacity = 0.5
            button1.translatesAutoresizingMaskIntoConstraints = false
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
            button2.translatesAutoresizingMaskIntoConstraints = false
            return button2
        }()
        
        view.addSubview(feedView)
        feedView.addSubview(button1)
        feedView.addSubview(button2)
        feedView.addSubview(customButton1)
        feedView.addSubview(customTextFIeld)
        
        
        NSLayoutConstraint.activate([
            feedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedView.topAnchor.constraint(equalTo: view.topAnchor),
            feedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: feedView.topAnchor, constant: 400),
            button1.heightAnchor.constraint(equalToConstant: 40),
            button1.widthAnchor.constraint(equalToConstant: 150),
            
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: feedView.topAnchor, constant: 500),
            button2.heightAnchor.constraint(equalToConstant: 40),
            button2.widthAnchor.constraint(equalToConstant: 150),
            
            customButton1.leftAnchor.constraint(equalTo: feedView.leftAnchor, constant: 20),
            customButton1.heightAnchor.constraint(equalToConstant: 40),
            customButton1.widthAnchor.constraint(equalToConstant: 100),
            customButton1.topAnchor.constraint(equalTo: feedView.topAnchor, constant: 140),
            
            customTextFIeld.leftAnchor.constraint(equalTo: feedView.leftAnchor, constant: 220),
            customTextFIeld.heightAnchor.constraint(equalToConstant: 40),
            customTextFIeld.widthAnchor.constraint(equalToConstant: 170),
            customTextFIeld.topAnchor.constraint(equalTo: feedView.topAnchor, constant: 140)
        ])
    }
    
    @objc func tap() {
        let postVC = PostViewController(viewModel: PostViewModel())
        navigationController?.pushViewController(postVC, animated: true)
        
    }
    
    private func enteredWordCheck() {
        let checkingWord = checker.check(word: customTextFIeld.text!)
        if checkingWord == true {
            customTextFIeld.textColor = .green
        } else {
            customTextFIeld.textColor = .red
        }
    }
}











