//
//  Models.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 15/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation

class Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let url: String
    
    init() {
        self.id = 0
        self.name = ""
        self.status = ""
        self.species = ""
        self.gender = ""
        self.image = ""
        self.url = ""
    }
}

class Result: Codable {
    let results: [Character]
}



