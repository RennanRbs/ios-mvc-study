//
//  CharactersViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 17/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CharactersViewController: CollectionCommonViewController {
    
    var characters = [Character]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchChars()
        self.view.backgroundColor = .white
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
      
        self.setupCollectionViewConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        self.title = "RickNMorty"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    func fetchChars() {
        let getRequest = NetworkManager.sharedInstance.createGetRequest(url: CharsURL.allCharacters.rawValue)
        NetworkManager.sharedInstance.sendGetRequest(getRequest: getRequest, type: Result.self) { (result, error) in
            if let requestResponse = result {
                self.characters = requestResponse.results
//                print(self.characters)
                DispatchQueue.main.async {
                    self.charCollectionView.reloadData()
                }
            } else {
                print("Response is nil")
            }
        }
    }
    
}

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) 
        
        return CGSize(width: itemSize, height: itemSize)
    }

}

extension CharactersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.charCollectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.charCollectionViewCell.rawValue, for: indexPath) as? CharactersCollectionViewCell else { return UICollectionViewCell() }
        cell.nameLabel.text = self.characters[indexPath.row].name
        cell.charImageView.imageFrom(url: self.characters[indexPath.row].image)
        
        return cell
    }
}

extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let controller = DetailViewController()
        controller.character = character
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
