//
//  DetailViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 03/09/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.title = character?.name ?? "Vazio"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        detailView.lbName.text = character?.name
        detailView.lbStatus.text = character?.status
        detailView.lbGender.text = character?.gender
        detailView.lbSpecies.text = character?.species
        detailView.ivPhoto.imageFrom(url: character!.image)
        
        self.view = detailView
        
    }

}
