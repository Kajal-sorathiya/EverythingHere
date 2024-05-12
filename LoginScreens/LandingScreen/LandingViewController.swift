//
//  LandingViewController.swift
//  LoginScreens
//
//  Created by Ahir on 12/05/24.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet private weak var collView: UICollectionView!
    @IBOutlet private weak var progressBarStackview: UIStackView!
    
//    var progressBars =
    
    var images = Array(1...7).map { "bagimage\($0)" }
    var currentIndex: Int = 0
    var progressViewTimer: Timer?
    var scrollTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        setupCollView()
        setupTimer()
        setupProgressBar()
    }
    private func setupCollView() {
        collView.delegate = self
        collView.dataSource = self
        collView.register(UINib(nibName: CollLandingCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollLandingCell.identifier)
    }
    
    private func setupTimer() {
        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollCellLogic), userInfo: nil, repeats: true)
        progressViewTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                 target: self,
                                                 selector: #selector(progressViewLogic),
                                                 userInfo: nil,
                                                 repeats: true)
    }
    
    private func setupProgressBar() {
        images.forEach { _ in
            let progressbar = UIProgressView(progressViewStyle: .bar)
            progressbar.trackTintColor = .black
            progressbar.progressTintColor = .brown
            progressbar.progress = 0
            progressBarStackview.addArrangedSubview(progressbar)
        }
    }
    
    @objc private func scrollCellLogic() {
        currentIndex += 1
        if currentIndex >= images.count {
            currentIndex = 0
            progressBarStackview.arrangedSubviews.forEach { progressview in
                if let progressview = progressview as? UIProgressView {
                    progressview.progress = 0
                }
            }
        }
        progressViewTimer?.invalidate()
        collView.scrollToItem(at: IndexPath(item: currentIndex, section: 0),
                              at: .right,
                              animated: true)
        progressViewTimer = Timer.scheduledTimer(timeInterval: 0.1,
                                                 target: self,
                                                 selector: #selector(progressViewLogic),
                                                 userInfo: nil,
                                                 repeats: true)
    }
    
    @objc private func progressViewLogic() {
        if let progressview = progressBarStackview.arrangedSubviews[currentIndex] as? UIProgressView {
            progressview.progress += 0.02
        }
    }
    
    private func dequeueImgCell(with indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collView.dequeueReusableCell(withReuseIdentifier: CollLandingCell.identifier, for: indexPath)
        if let cell = cell as? CollLandingCell {
            cell.config(with: images[indexPath.row])
            return cell
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let progressview = progressBarStackview.arrangedSubviews[currentIndex] as? UIProgressView {
            progressview.progress += 1
        }
        currentIndex = Int(collView.contentOffset.x / collView.frame.size.width)
        scrollTimer?.invalidate()
        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollCellLogic), userInfo: nil, repeats: true)
        
    }
}
extension LandingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueImgCell(with: indexPath)
    }
}

extension LandingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collView.frame.width, height: collView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
