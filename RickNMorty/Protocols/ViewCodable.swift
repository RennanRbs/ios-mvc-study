//
//  ViewCodable.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

protocol ViewCodable {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func buildViewHierarchy() {}
    func setupConstraints() {}
    func applyAdditionalChanges() {}
}
