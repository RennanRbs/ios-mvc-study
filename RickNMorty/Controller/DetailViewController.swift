//
//  DetailViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 03/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var charImage: UIImage?
    let charImageView = CharactersCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func setupCharView() {
        self.view.addSubview(charImageView)
        charImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            charImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            charImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            
        ])
       
        
    }

}
