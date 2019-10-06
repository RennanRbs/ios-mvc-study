//
//  CharactersCollectionViewCell.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 17/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell {
    
    lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Char Name"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    func setupComponentsInCell() {
        self.addSubview(self.charImageView)
        self.charImageView.addSubview(self.blurView)
        self.blurView.addSubview(self.nameLabel)
        setupCellAdjustment()
        self.setupImageViewConstraints()
        self.setupBlurViewConstraints()
        self.setupNameLabelConstraints()
    }
    
    func setupCellAdjustment(){
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponentsInCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }
    
}

