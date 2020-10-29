//
//  CharactersViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 17/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CharactersViewController: CollectionCommonViewController {
    private var characters = [Character]()
    private let router: Router<CharacterEndpoint>
    
    init(router: Router<CharacterEndpoint>) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchChars()
        customizeView()
        setupCollectionView()
        setupNavigationBar()
    } 

    private func customizeView() {
        self.view.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
        self.setupCollectionViewConstraints()
    }
    
    private func setupNavigationBar(){
        self.title = "RickNMorty"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func fetchChars() {
        router.request(.listCharacters) { result in
            switch result {
            case .success(let characters):
                self.characters = characters.results
                DispatchQueue.main.async {
                    self.charCollectionView.reloadData()
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
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
        print(character.name)
        controller.character = character
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
