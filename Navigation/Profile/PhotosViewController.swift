//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 24.09.2021.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    var receivedImages = [UIImage]()
    var imagePublisherFacade = ImagePublisherFacade()
    
    var photos: Photos
    
    init(photos: Photos) {
        self.photos = photos
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for i in Images.allCases {
            print(i)
            receivedImages.append(i.image(name: i))
        }
        
//        let x = Images.checkmark
//        receivedImages.append(x.image(name: .checkmark))
        view.addSubview(collectionView)
        collectionView.reloadData()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.backgroundColor = .white
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 1, repeat: 10, userImages: receivedImages)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView.frame = CGRect(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.top)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            imagePublisherFacade.subscribe(self)
        
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            navigationController?.navigationBar.isHidden = true
            imagePublisherFacade.removeSubscription(for: self)
        }
    
}


extension PhotosViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return receivedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        
        guard receivedImages.isEmpty == false else {
            return cell
        }
      
        cell.feedPhoto.image = receivedImages[indexPath.item]
       
        return cell
    }
    
  
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10 * 4)/3, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        receivedImages = images
        collectionView.reloadData()
    }
}
