//
//  Models.swift
//  RickNMorty
//
//  Created by Gabriel Palhares on 15/07/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let url: String
}

struct Result: Codable {
    let results: [Character]
}



