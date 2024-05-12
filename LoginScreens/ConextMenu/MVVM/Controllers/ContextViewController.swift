//
//  ContextViewController.swift
//  LoginScreens
//
//  Created by Ahir on 16/03/24.
//

import UIKit

class ContextViewController: UIViewController {
    
    let images = Array(1...6).map { "image\($0)" }
    var favourites = [Int]()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
     }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension ContextViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCellWith(images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil) {  _ in
            let open = UIAction(
                title: "Open",
                image: UIImage(systemName: "link")) { _ in
                    print("Open clicked")
                }
            let favourite = UIAction(
                title: "Done",
                image: UIImage(systemName: "heart")) { _ in
                    print("Favourite clicked")
                }
            let details = UIAction(
                title: "Details",
                image: UIImage(systemName: "info.circle")) { _ in
                    print("Done clicked")
                }
            return UIMenu(title: "Action",
                          image: UIImage(named: ""),
                          children: [open, favourite, details])
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
//        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
//            let open = UIAction(
//                title: "Open",
//                image: UIImage(systemName: "link"),
//                state: .off) { _ in
//                    print("Open clicked")
//                }
//
//            let favourite = UIAction(
//                title: "Favourite",
//                image: UIImage(systemName: "star")) { _ in
//                    print("Favourite clicked")
//                }
//
//            let search = UIAction(
//                title: "Search",
//                image: UIImage(systemName: "magnifyingglass")) { _ in
//                    print("Search clicked")
//                }
//            return UIMenu(
//                title: "Actions",
//                options: UIMenu.Options.displayInline,
//                children: [open,
//                           favourite,
//                           search]
//            )
//        }
//        return config
//    }
    
}

extension ContextViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.size.width / 2)-4, height: (view.frame.size.width / 2)-4)
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
//    static let identifier = "ImageCollectionViewCell"
    
    let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imgView.image = nil
    }
    
    func configureCellWith(_ image: String) {
        imgView.image = UIImage(named: image)
    }
}
