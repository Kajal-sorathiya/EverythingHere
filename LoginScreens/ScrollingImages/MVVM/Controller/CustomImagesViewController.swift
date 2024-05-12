//
//  CustomImagesViewController.swift
//  LoginScreens
//
//  Created by Ahir on 13/03/24.
//

import UIKit

class CustomImagesViewController: UIViewController {

    @IBOutlet weak var pages: UIPageControl!
    @IBOutlet weak var imgCollectionView: UICollectionView!
    
    // MARK: User Defined Variables
    var images = Array(1...7).map { "bagimage\($0)" }
    var index: Int = 0
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetups()
    }
    
    // MARK: User Defined Methods
    private func initialSetups() {
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        setTimer()
    }
    
    private func setTimer() {
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollingUp), userInfo: [], repeats: true)
    }
    
    @objc private func scrollingUp() {
        if index < images.count - 1 {
            index += 1
        } else {
            index = 0
        }
        pages.numberOfPages = images.count
        pages.currentPage = index
        imgCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .right, animated: true)
    }
}

// MARK: Collectionview delegate methods
extension CustomImagesViewController: UICollectionViewDelegate {
    
}

extension CustomImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = imgCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureImgsCell(images[indexPath.row])
        return cell
    }
}

extension CustomImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
