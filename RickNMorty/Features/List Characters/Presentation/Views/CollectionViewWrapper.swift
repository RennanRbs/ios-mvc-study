//
//  CollectionViewWrapper.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import UIKit

class CollectionViewWrapper<Cell: CollectionViewWrappableCell>: UIView, CollectionViewable {
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(Cell.self, forCellWithReuseIdentifier: cellIdentifier)
        collection.contentInset = contentInset
        return collection
    }()
    
    var wrappedCollection: UICollectionView {
        return collectionView
    }
    
    var cellWrappedType: Cell.Type {
        return Cell.self
    }
    
    var cellIdentifier: String {
        return Cell.identifier
    }
    
    var collectionBackgroundColor: UIColor? {
        get {
            collectionView.backgroundColor
        }
        set {
            collectionView.backgroundColor = newValue
        }
    }
    
    private let contentInset: UIEdgeInsets
    private let layout: UICollectionViewFlowLayout
    
    init(contentInset: UIEdgeInsets = .zero, layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout(), backgroundColor: UIColor? = .white) {
        self.contentInset = contentInset
        self.layout = layout
        super.init(frame: .zero)
        self.collectionBackgroundColor = backgroundColor
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension CollectionViewWrapper: ViewCodable {
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
