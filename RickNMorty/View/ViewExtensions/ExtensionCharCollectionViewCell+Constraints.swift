//
//  ExtensionCharCollectionViewCell+Constraints.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 18/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

extension CharactersCollectionViewCell {
    
    func setupImageViewConstraints() {
        self.charImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.charImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.charImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.charImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupBlurViewConstraints() {
        self.blurView.leadingAnchor.constraint(equalTo: self.charImageView.leadingAnchor).isActive = true
        self.blurView.trailingAnchor.constraint(equalTo: self.charImageView.trailingAnchor).isActive = true
        self.blurView.bottomAnchor.constraint(equalTo: self.charImageView.bottomAnchor).isActive = true
        self.blurView.heightAnchor.constraint(equalTo: self.charImageView.heightAnchor, multiplier: 0.3).isActive = true
    }
    
    func setupNameLabelConstraints() {
        self.nameLabel.leadingAnchor.constraint(equalTo: self.blurView.leadingAnchor, constant: 12).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.blurView.trailingAnchor, constant: -12).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.blurView.centerYAnchor).isActive = true
    }
    
}
