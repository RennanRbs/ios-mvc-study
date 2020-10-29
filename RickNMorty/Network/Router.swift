//
//  Router.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    typealias Endpoint = EndPoint
    typealias ResponseData = EndPoint.ResponseType
    
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request(_ route: EndPoint, completion: @escaping (Result<ResponseData, NetworkError>) -> Void) {
        guard let request = makeURLRequest(route: route) else {
            completion(.failure(.requestError))
            return
        }
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.requestError))
                return
            }
            guard let urlResponse = response as? HTTPURLResponse, (200...299).contains(urlResponse.statusCode) else {
                completion(.failure(.invalidResponseError))
                return
            }
            if let data = data {
                do {
                    let parsedData = try JSONDecoder().decode(route.responseType, from: data)
                    completion(.success(parsedData))
                } catch {
                    completion(.failure(.parseFailedError))
                }
            }
        }
        task.resume()
    }
    
    private func makeURLRequest(route: EndPoint) -> URLRequest? {
        let urlString = makeURL(route: route)
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        request.httpMethod = route.httpMethod
        request.allHTTPHeaderFields = route.headers
        return request
    }
    
    private func makeURL(route: EndPoint) -> String {
        let url = "\(route.baseURL)" + route.path
        return url
    }
}
