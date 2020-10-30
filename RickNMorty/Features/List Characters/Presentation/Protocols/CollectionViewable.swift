//
//  CollectionViewable.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import UIKit

protocol CollectionViewable: AnyObject {
    associatedtype Cell
    
    var wrappedCollection: UICollectionView { get }
    var cellIdentifier: String { get }
    var cellWrappedType: Cell.Type { get }
    
    func reloadData()
}

