//
//  InfoViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 28.08.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "No text"
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .lightGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 3
        return titleLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        let alertButton: MyCustomButton = {
            let button = MyCustomButton(title: "Alert", color: .systemGray, target: tap)
            button.frame =  CGRect(x: 100, y: 300, width: 200, height: 50)
            button.center = self.view.center
            button.backgroundColor = UIColor.darkGray
            button.setTitleColor(UIColor.black, for: .normal)
            return button
        }()
        view.addSubview(alertButton)
        view.addSubview(titleLabel)
        
        setUpView()
        serilization()
    }
    
    func setUpView() {
        let constraints = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -270),
            titleLabel.heightAnchor.constraint(equalToConstant: 150),
            titleLabel.widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func serilization() {
        var user = UserJson(userId: 1, id: 1, title: "", completed: false)
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/5") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
        if let unwrappedData = data {
            do {
                let serializedDict = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                if let dictionary = serializedDict as? [String: Any] {
                    if let title = dictionary["title"] as? String {
                        user.title = title
                    }
                    if let id = dictionary["id"] as? Int {
                        user.id = id
                    }
                    if let completed = dictionary["completed"] as? Bool {
                        user.completed = completed
                    }
                    if !user.title.isEmpty {
                        DispatchQueue.main.async {
                            self.titleLabel.text = user.title
                        }
                    }
                }
            }
            catch let error {
                print(error)
            }
        }
    }
        .resume()
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

struct UserJson: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}


