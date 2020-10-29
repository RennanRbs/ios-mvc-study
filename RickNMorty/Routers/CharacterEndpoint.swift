//
//  CharacterRouter.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

enum CharacterEndpoint {
    case listCharacters
}

extension CharacterEndpoint: EndPointType {
    typealias ResponseType = CharacterResult
    
    var responseType: CharacterResult.Type {
        CharacterResult.self
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://rickandmortyapi.com") else {
            fatalError("Could not load base url.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .listCharacters:
            return "/api/character/"
        }
    }
    
    var httpMethod: String {
        return "GET"
    }
    
    var headers: HTTPHeaders {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}
