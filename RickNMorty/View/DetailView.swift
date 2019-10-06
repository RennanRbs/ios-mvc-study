//
//  DetailView.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 11/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class DetailView: BaseView {
    
    let character = Character()
    
    lazy var ivPhoto: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
//        image.image = UIImage(named: self.character.image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        return image
    }()
    
    lazy var lbName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
//        label.text = self.character.name
        label.text = "Mateus Sales"
        label.font = label.font.withSize(24)
        return label
    }()
    
    lazy var lbStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Mateus Sales"
        label.font = label.font.withSize(18)
        return label
    }()
    
    lazy var lbSpecies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Mateus Sales"
        label.font = label.font.withSize(18)
        return label
    }()
    
    lazy var lbGender: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Mateus Sales"
        label.font = label.font.withSize(18)
        return label
    }()
    
    override func initialize() {
        self.backgroundColor = .white
    }
    
    override func addViews() {
        addSubview(ivPhoto)
        addSubview(lbName)
        addSubview(lbStatus)
        addSubview(lbSpecies)
        addSubview(lbGender)
    }
    
    override func autoLayout() {
        NSLayoutConstraint.activate([
            ivPhoto.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            ivPhoto.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 24),
            ivPhoto.heightAnchor.constraint(equalToConstant: 200),
            ivPhoto.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            lbName.topAnchor.constraint(equalTo: ivPhoto.bottomAnchor, constant: 12),
            lbName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lbName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbName.heightAnchor.constraint(equalToConstant: 30),
        ])

        NSLayoutConstraint.activate([
            lbStatus.topAnchor.constraint(equalTo: lbName.bottomAnchor, constant: 8),
            lbStatus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lbStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbStatus.heightAnchor.constraint(equalToConstant: 30),
        ])

        NSLayoutConstraint.activate([
            lbSpecies.topAnchor.constraint(equalTo: lbStatus.bottomAnchor, constant: 8),
            lbSpecies.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lbSpecies.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbSpecies.heightAnchor.constraint(equalToConstant: 30),
        ])

        NSLayoutConstraint.activate([
            lbGender.topAnchor.constraint(equalTo: lbSpecies.bottomAnchor, constant: 8),
            lbGender.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            lbGender.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lbGender.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
