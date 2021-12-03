//
//  Post.swift
//  Navigation
//
//  Created by Владлен Морозов on 09.09.2021.
//

import UIKit

struct Post {
    let author: String
    let image: String
    let description: String
    let likes: Int
    let views: Int
}

struct Posts {
    static let content = [
    Post(author: "Hipster Dogo", image: "dogo", description: "Who let the dogs out?!", likes: 132, views: 434),
    Post(author: "Hipster Cat", image: "cat", description: "Look at my glasses", likes: 43, views: 54),
    Post(author: "Hipster Panda", image: "panda", description: "Listen to music", likes: 13, views: 24),
    Post(author: "Hipster Monkey", image: "avatar", description: "Love to brush teeth", likes: 34, views: 51)
    ]

}

struct Photos {
    let photos: [String]
    
    let images: [UIImage]
    init() {
        self.photos = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20"
        ]
        self.images = photos.compactMap { UIImage(named: $0) }
        
    }
}
