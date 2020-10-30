//
//  CharactersCollectionViewCell.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 17/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CharactersCollectionViewCell: UICollectionViewCell, CollectionViewWrappableCell {
    static var identifier: String = "CharactersCollectionViewCell"
    
    private let charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let blurView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Char Name"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    func setupCell(character: Character) {
        nameLabel.text = character.name
        charImageView.imageFrom(url: character.image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func configCollectionCell(){
        contentView.layer.cornerRadius = 4.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }
}

extension CharactersCollectionViewCell: ViewCodable {
    func buildViewHierarchy() {
        contentView.addSubview(self.charImageView)
        charImageView.addSubview(self.blurView)
        blurView.addSubview(self.nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            charImageView.topAnchor.constraint(equalTo: self.topAnchor),
            charImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            charImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            charImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: self.charImageView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: self.charImageView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: self.charImageView.bottomAnchor),
            blurView.heightAnchor.constraint(equalTo: self.charImageView.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.blurView.leadingAnchor, constant: 12),
            nameLabel.trailingAnchor.constraint(equalTo: self.blurView.trailingAnchor, constant: -12),
            nameLabel.centerYAnchor.constraint(equalTo: self.blurView.centerYAnchor)
        ])
    }
    
    func applyAdditionalChanges() {
        configCollectionCell()
    }
}
