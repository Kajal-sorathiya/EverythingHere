//
//  FlowLayoutViewController.swift
//  LoginScreens
//
//  Created by Ahir on 07/05/24.
//

import UIKit

class FlowLayoutViewController: UIViewController {

    @IBOutlet private weak var collView: UICollectionView!
    
    @IBOutlet weak var conCollHeight: NSLayoutConstraint!
    var titles = ["This is demo", "Only demo", "Demo", "This is demo", "This is demo", "This is demo", "This is demo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(collView.contentSize.height)
        conCollHeight.constant = collView.contentSize.height

    }
    private func setupCollView() {
        collView.delegate = self
        collView.dataSource = self
        collView.register(UINib(nibName: CollFlowLayoutCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollFlowLayoutCell.identifier)
//        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.estimatedItemSize = CGSize(width: collView.frame.width, height: 75)
//            collView.collectionViewLayout = layout
//        }
    }   
}

extension FlowLayoutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collView.dequeueReusableCell(withReuseIdentifier: "CollFlowLayoutCell", for: indexPath)
        if let cell = cell as? CollFlowLayoutCell {
            cell.config(strTitle: titles[indexPath.row])
            return cell
        }
        return cell
    }
}

extension FlowLayoutViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collView.frame.size.width / 2, height: collView.frame.width / 3)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSizeMake(view.frame.width , 64)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//      let approximateWidthOfContent = view.frame.width - 100
//        // x is the width of the logo in the left
//
//      let size = CGSize(width: approximateWidthOfContent, height: 1000)
//
//      //1000 is the large arbitrary values which should be taken in case of very high amount of content
//
//        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
//        let estimatedFrame = NSString(string: titles[indexPath.row]).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//     return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
//     }
    
}
