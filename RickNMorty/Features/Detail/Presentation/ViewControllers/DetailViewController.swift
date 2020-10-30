//
//  DetailViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 03/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private lazy var detailView = DetailView(character: character)
    private let character: Character
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigation() {
        self.title = character.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        self.view = detailView
    }
}

extension DetailViewController: ViewCodable {
    func applyAdditionalChanges() {
        view.backgroundColor = .white
        setupNavigation()
    }
}
