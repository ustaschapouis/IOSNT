//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Владлен Морозов on 24.09.2021.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let feedPhoto: UIImageView = {
        let photo1 = UIImageView()
        photo1.layer.cornerRadius = 6
        photo1.clipsToBounds = true
        photo1.translatesAutoresizingMaskIntoConstraints = false
        return photo1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PhotosCollectionViewCell {
    func setupCellView() {
        
        contentView.addSubview(feedPhoto)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            feedPhoto.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            feedPhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            
        ])
        
    }
}
