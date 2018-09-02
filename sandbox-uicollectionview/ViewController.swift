//
//  ViewController.swift
//  sandbox-uicollectionview
//
//  Created by Knut Valen on 15/04/2018.
//  Copyright © 2018 Knut Valen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var array = ["foo", "bar", "baz"]
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView {
            return array.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if let myCell = cell as? MyCollectionViewCell {
            myCell.titleLabel.text = array[indexPath.item]
            myCell.subtitleLabel.text = "my subtitle for " + array[indexPath.item] + " is a very long text with many letters and words"
            return myCell
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let forcedWidth: CGFloat = 200
        let myCell = MyCollectionViewCell()
        myCell.titleLabel.text = array[indexPath.item]
        myCell.subtitleLabel.text = "my subtitle for " + array[indexPath.item] + " is a very long text with many letters and words"
        myCell.subtitleLabel.preferredMaxLayoutWidth = forcedWidth - myCell.myMargin
        let optimalSize = myCell.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        let forcedSize = CGSize(width: forcedWidth, height: optimalSize.height)
        return forcedSize
    }
}

