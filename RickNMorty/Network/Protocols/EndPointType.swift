//
//  EndPointType.swift
//  RickNMorty
//
//  Created by Thalys Viana on 29/10/20.
//  Copyright © 2020 Gabriel Palhares. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]?
typealias HTTPBody = [String: Any]

protocol EndPointType {
    associatedtype ResponseType: Decodable
    var responseType: ResponseType.Type { get }

    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var body: HTTPBody { get }
}

extension EndPointType {
    var body: HTTPBody {
        return ["": ""]
    }
    
    func bodySerialized(_ content: [String: Any]) -> Data? {
        do {
            let serializedContent = try JSONSerialization.data(withJSONObject: content, options: .prettyPrinted)
            return serializedContent
        } catch {
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
