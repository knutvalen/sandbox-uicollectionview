//
//  MyCollectionViewCell.swift
//  sandbox-uicollectionview
//
//  Created by Knut Valen on 27/05/2018.
//  Copyright © 2018 Knut Valen. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    let myMargin: CGFloat = 8
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        backgroundColor = .green
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: myMargin).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -myMargin).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: myMargin).isActive = true
        
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: myMargin).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -myMargin).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: myMargin).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -myMargin).isActive = true
    }
}
