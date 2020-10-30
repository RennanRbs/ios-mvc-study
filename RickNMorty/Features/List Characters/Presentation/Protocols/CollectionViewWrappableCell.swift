//
//  CollectionViewWrappableCell.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import UIKit

protocol CollectionViewWrappableCell: UICollectionViewCell {
    static var identifier: String { get }
}
