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
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 3
        titleLabel.layer.cornerRadius = 10
        return titleLabel
    }()
    
    private let titleLabel2: UILabel = {
        let titlelabel = UILabel()
        titlelabel.text = "No text"
        titlelabel.textColor = .cyan
        titlelabel.backgroundColor = .systemBlue
        titlelabel.textAlignment = .center
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        titlelabel.layer.cornerRadius = 12
        return titlelabel
    }()
    
    var residents = [String]()
    
    struct UserJson: Codable {
        var userId: Int
        var id: Int
        var title: String
        var completed: Bool
    }
    
    struct Planet: Codable {
        let name: String
        let rotationPeriod: String
        let orbitalPeriod: String
        let diameter: String
        let climate: String
        let gravity: String
        let terrain: String
        let surfaceWater: String
        let population: String
        let residents: [String]
        let films: [String]
        let created: String
        let edited: String
        let url: String
    }
    
    struct Resident: Codable {
        let name: String
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter = "diameter"
        case climate = "climate"
        case gravity = "gravity"
        case terrain = "terrain"
        case surfaceWater = "surface_water"
        case population = "population"
        case residents = "residents"
        case films = "films"
        case created = "created"
        case edited = "edited"
        case url = "url"
    }
    
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
        view.addSubview(titleLabel2)
        
        setUpView()
        serilization()
        fetchJson()
    }
    
    func setUpView() {
        let constraints = [
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -270),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            titleLabel2.heightAnchor.constraint(equalToConstant: 100),
            titleLabel2.widthAnchor.constraint(equalToConstant: 200)
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
    
    func fetchJson(){
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let unwrappedData = data {
                do {
                    let planet = try JSONDecoder().decode(Planet.self, from: unwrappedData)
                    planet.residents.forEach { residentUrl in
                        self.fetchResident(stringURL: residentUrl)
                    }
                    DispatchQueue.main.async {
                        self.titleLabel2.text = planet.orbitalPeriod
                    }
                }
                catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func fetchResident(stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let unwrappedDate = data {
                do {
                    let resident = try JSONDecoder().decode(Resident.self, from: unwrappedDate)
                    self.residents.append(resident.name)
                    DispatchQueue.main.sync {
                    }
                }
                catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
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


