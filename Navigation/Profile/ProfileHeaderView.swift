//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Владлен Морозов on 31.08.2021.
//

import UIKit
import SnapKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    private var statusText = ""
    
    var animeHeightAnchor: NSLayoutConstraint!
    var animeWidhtAnchor: NSLayoutConstraint!
    var animeLeftAnchor: NSLayoutConstraint!
    var animeTopAnchor: NSLayoutConstraint!
    
    let headerView: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    let buttonField: UIButton = {
        let button = UIButton()
        button.setTitle("Set Status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.masksToBounds = true
        avatar.isUserInteractionEnabled = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    
    let nameTextField: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Hipster Monkey"
        textLabel.textColor = UIColor.black
        textLabel.font = UIFont.boldSystemFont(ofSize: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    //
    let statusField: UITextField = {
        let status = UITextField()
        status.backgroundColor = .white
        status.placeholder = "Write your status"
        status.textColor = .black
        status.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        status.addTarget(self, action: #selector(statusTextChanged(_: )), for: .editingChanged)
        status.translatesAutoresizingMaskIntoConstraints = false
        status.layer.cornerRadius = 6
        return status
    }()
    
    var statusLabelField: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent() {
        contentView.addSubview(headerView)
        headerView.addSubview(avatarImage)
        headerView.addSubview(buttonField)
        headerView.addSubview(nameTextField)
        headerView.addSubview(statusField)
        headerView.addSubview(statusLabelField)
        contentView.backgroundColor = .systemGray5
        
        headerView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        avatarImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.left.equalTo(headerView).inset(UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0))
        }
        
        buttonField.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.size.equalTo(CGSize(width: 380, height: 50))
            make.top.equalTo(contentView).offset(142)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.left.top.equalTo(contentView).inset(UIEdgeInsets(top: 16, left: 136, bottom: 0, right: 0))
            make.height.equalTo(50)
        }
        
        statusField.snp.makeConstraints { (make) in
            make.top.left.equalTo(nameTextField).inset(UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
        }
        
        statusLabelField.snp.makeConstraints { (make) in
            make.top.left.equalTo(statusField).inset(UIEdgeInsets(top: 35, left: 0, bottom: 0, right: 0))
        }
    }
    
    @objc func tap() {
        statusLabelField.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = statusField.text!
    }
    
    
}










