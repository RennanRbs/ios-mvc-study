//
//  CollectionCommonViewController.swift
//  RickNMorty
//
//  Created by Rennan Rebouças on 04/10/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit



class CollectionCommonViewController: UIViewController {
    
   
    
    let charCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CharactersCollectionViewCell.self, forCellWithReuseIdentifier: ReuseIdentifier.charCollectionViewCell.rawValue)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
}
