//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Владлен Морозов on 24.09.2021.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController, UICollectionViewDelegate, ImageLibrarySubscriber {
    
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
    var imageProcessor = ImageProcessor()
    init(photos: Photos) {
        self.photos = photos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Photo Gallery"
        navigationController?.navigationBar.backgroundColor = .white
        processImages()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.frame = CGRect(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height - view.safeAreaInsets.top)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        imagePublisherFacade.subscribe(self)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        imagePublisherFacade.removeSubscription(for: self)
    }
    
    func receive(images: [UIImage]) {
        receivedImages = images
        images.forEach {
            self.receivedImages.append($0)
        }
        collectionView.reloadData()
        
    }
    
    private func processImages() {
        var processedImages = [UIImage]()
        imageProcessor.processImagesOnThread(sourceImages: photos.images, filter: .posterize, qos: .utility) { [self] processedPhoto in
            for photo in processedPhoto {
                if let image = photo {
                    processedImages.append(UIImage(cgImage: image))
                }
            }
            DispatchQueue.main.async {
                imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 20, userImages: processedImages)
                print("Succeed")
            }
        }
    }
}
/// filter: noir, qos: userInteractive - 14 секунд
///filter: fade, userInteractive: background - больше 1 минуты
///filter: posterize, qos: utility - 17 секунд

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

