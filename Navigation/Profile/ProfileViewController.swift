//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 31.08.2021.
//

import UIKit
import iOSIntPackage

class ProfileViewController: UIViewController {
    let cellID = "cellID"
    let tableView = UITableView(frame: .zero, style: .grouped)
    private var avatarImageView: UIImageView?
    private var backgroundView:  UIView?
    private var crossButton = UIImageView(image: UIImage(systemName: "xmark"))
    let photos = Photos()

    let userService: UserService
    let enteredUserName: String

    init(userService: UserService, enteredUserName: String) {
        self.userService = userService
        self.enteredUserName = enteredUserName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }

    func setupView () {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(ProfileTableHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "Photos")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray5

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return Posts.content.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Photos", for: indexPath) as! PhotosTableViewCell
            cell.feedPhoto1.image = UIImage(named: photos.photos[indexPath.row])
            cell.feedPhoto2.image = UIImage(named: photos.photos[indexPath.row + 1])
            cell.feedPhoto3.image = UIImage(named: photos.photos[indexPath.row + 2])
            cell.feedPhoto4.image = UIImage(named: photos.photos[indexPath.row + 3])

            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! PostTableViewCell
        let postCell = Posts.content[indexPath.row]
        cell.authorLabel.text = postCell.author
        cell.descriptionLabel.text = postCell.description
        cell.likesLabel.text = "Likes: \(postCell.likes)"
        cell.viewsLabel.text = "Views: \(postCell.views)"
        cell.indexPath = indexPath
        cell.configureCell(imageFilter: ColorFilter.randomFilter())
            return cell

        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ProfileTableHeaderView


        header.avatarImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarResize)))
            header.avatarImage.isUserInteractionEnabled = true

            return header
        } else {
            return nil
        }

    }

    @objc func avatarResize(sender: UITapGestureRecognizer) {

        self.view.layoutIfNeeded()


        func setupAvatarImageView(){
            let imageView = sender.view as! UIImageView
            avatarImageView = UIImageView(image: imageView.image)
            avatarImageView?.layer.cornerRadius = view.bounds.height / 2
            avatarImageView?.contentMode = .scaleAspectFit
            avatarImageView?.clipsToBounds = true
        }
        setupAvatarImageView()

        func setupBackgroundView() {
            backgroundView = UIView(frame: UIScreen.main.bounds)
            backgroundView?.backgroundColor = UIColor.white
            backgroundView?.alpha = 0
        }
        setupBackgroundView()

        func setupCrossButton(){
            crossButton.sizeToFit()
            crossButton.tintColor = .black
            crossButton.transform = crossButton.transform.scaledBy(x: 1, y: 1)
            crossButton.alpha = 0
        }
        setupCrossButton()


        self.view.addSubview(backgroundView ?? UIImageView())
        self.view.addSubview(avatarImageView ?? UIView())
        avatarImageView?.addSubview(crossButton)


        self.tabBarController?.tabBar.isHidden = true

        UIView.animate(withDuration: 0.5, animations: {[self] in
        avatarImageView?.transform = (avatarImageView?.transform.scaledBy(
        x: view.safeAreaLayoutGuide.layoutFrame.width / (avatarImageView?.frame.width)!,
        y: view.safeAreaLayoutGuide.layoutFrame.width / (avatarImageView?.frame.width)!))!
        avatarImageView?.frame.origin = CGPoint(x: view.safeAreaLayoutGuide.layoutFrame.minX, y: view.frame.height / 4)
        avatarImageView?.layer.cornerRadius = 0
        backgroundView?.alpha = 0.5},
        completion: {finished in
                    UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: [], animations: {
                        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                            if self.avatarImageView != nil
                            { self.crossButton.frame.origin = CGPoint(
                                    x: self.avatarImageView!.frame.midX + 35,
                                    y: 15)
                }
                }
        UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                            self.crossButton.alpha = 1
                }
            })
            })
                       
        avatarImageView?.isUserInteractionEnabled = true
        crossButton.isUserInteractionEnabled = true
        let exitTap = UITapGestureRecognizer(target: self, action: #selector(reversViewAnimate))
        crossButton.addGestureRecognizer(exitTap)
        self.view.layoutIfNeeded()
            }
      

    @objc func reversViewAnimate(){
        self.view.layoutIfNeeded()
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1){
                self.crossButton.alpha = 0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1){
                self.backgroundView?.alpha = 0
                self.backgroundView = nil
            }

            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1){
                self.avatarImageView?.alpha = 0
                self.avatarImageView?.layer.cornerRadius = self.view.bounds.height / 2
                self.avatarImageView?.frame = CGRect(
                    x: 1,
                    y: 1,
                    width: 1,
                    height: 1)
                self.avatarImageView = nil
            }
        })
        self.view.layoutIfNeeded()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
        return 220
        } else {
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosVC = PhotosViewController(photos: photos)
        if indexPath.section == 0 {
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

}

extension ColorFilter {
    static func randomFilter() -> ColorFilter {
        let randomInt = Int.random(in: 0...7)
        return self.allCases[randomInt]
    }
}




