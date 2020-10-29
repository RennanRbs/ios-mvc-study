//
//  EndPointType.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]?

protocol EndPointType {
    associatedtype ResponseType: Decodable
    var responseType: ResponseType.Type { get }

    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: String { get }
    var headers: HTTPHeaders { get }
}
