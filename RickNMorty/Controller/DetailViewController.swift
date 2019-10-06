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
    let detailView = DetailView()
    var character = Character()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        print(character.name)
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.title = character.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        self.view = detailView
    }

}
