//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Владлен Морозов on 15.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    let postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let authorLabel: UILabel = {
        let author = UILabel()
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    let likesLabel: UILabel = {
        let likes = UILabel()
        likes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        likes.text = "Likes"
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    let viewsLabel: UILabel = {
        let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
      
    }
    
    func setupCellView() {
        contentView.backgroundColor = .white
        contentView.addSubview(postImage)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -68),
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            
            
            likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            
            viewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16)
        ])
    }
    
    }


