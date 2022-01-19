//
//  Post.swift
//  Navigation
//
//  Created by Владлен Морозов on 09.09.2021.
//

import UIKit

public struct Post {
    public let author: String
    public let image: String
    public let description: String
    public let likes: Int
    public let views: Int
    public init(author: String, image: String, description: String, likes: Int, views: Int) {
        self.author = author
        self.image = image
        self.description = description
        self.likes = likes
        self.views = views
    }
}

public struct Posts {
  
   public let post1 =  Post(author: "Hipster Dogo", image: "dogo", description: "Who let the dogs out?!", likes: 132, views: 434)
    public let post2 = Post(author: "Hipster Cat", image: "cat", description: "Look at my glasses", likes: 43, views: 54)
    public let post3 = Post(author: "Hipster Panda", image: "panda", description: "Listen to music", likes: 13, views: 24)
    public let post4 =   Post(author: "Hipster Monkey", image: "avatar", description: "Love to brush teeth", likes: 34, views: 51)
    
    public let content: [Post]
    public init() {
        self.content = [post1, post2, post3, post4]
    }
}

//                       [
//    Post(author: "Hipster Dogo", image: "dogo", description: "Who let the dogs out?!", likes: 132, views: 434),
//    Post(author: "Hipster Cat", image: "cat", description: "Look at my glasses", likes: 43, views: 54),
//    Post(author: "Hipster Panda", image: "panda", description: "Listen to music", likes: 13, views: 24),
//    Post(author: "Hipster Monkey", image: "avatar", description: "Love to brush teeth", likes: 34, views: 51)
//    ]
    


public struct Photos {
    public let photos: [String]
   public let images: [UIImage]
    public init() {
        self.photos = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8", "photo9", "photo10", "photo11", "photo12", "photo13", "photo14", "photo15", "photo16", "photo17", "photo18", "photo19", "photo20"]
        self.images = photos.compactMap { UIImage(named: $0) }
        
    }
}

