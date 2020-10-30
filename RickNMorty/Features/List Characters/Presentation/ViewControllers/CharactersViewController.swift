//
//  CharactersViewController.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 17/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    private var characters = [Character]()
    private let router: Router<CharacterEndpoint>
    
    private let charactersCollection = CollectionViewWrapper<CharactersCollectionViewCell>(contentInset: UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16))
    
    init(router: Router<CharacterEndpoint>) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = charactersCollection
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchChars()
    }
    
    private func setupCollectionView() {
        charactersCollection.wrappedCollection.delegate = self
        charactersCollection.wrappedCollection.dataSource = self
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
                    self.charactersCollection.reloadData()
                }
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}

extension CharactersViewController: ViewCodable {
    func applyAdditionalChanges() {
        setupCollectionView()
        setupNavigationBar()
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
        let cell: CharactersCollectionViewCell = charactersCollection.wrappedCollection.dequeueReusableCell(withReuseIdentifier: charactersCollection.cellIdentifier, for: indexPath)
        let character = characters[indexPath.item]
        cell.setupCell(character: character)
        return cell
    }
}

extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let controller = DetailViewController(character: character)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
