//
//  NetworkRouter.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case requestError
    case invalidResponseError
    case parseFailedError
}

protocol NetworkRouter {
    associatedtype EndPoint
    associatedtype ResponseData
    func request(_ route: EndPoint, completion: @escaping (Result<ResponseData, NetworkError>) -> Void)
}
