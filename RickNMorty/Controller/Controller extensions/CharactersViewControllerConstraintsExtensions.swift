//
//  CharactersViewControllerConstraintsExtensions.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 26/08/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

extension CharactersViewController {
    
    func setupCollectionViewConstraints() {
        self.view.addSubview(self.charCollectionView)
    
        NSLayoutConstraint.activate([
            charCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            charCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            charCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            charCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

